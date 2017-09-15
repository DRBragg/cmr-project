import React from 'react';
import { Navbar, FormGroup, FormControl, Button, Nav, NavDropdown, NavItem } from 'react-bootstrap';
import LoginForm from './LoginForm'

class Navigation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: this.props.user
    }
    this.signIn = this.signIn.bind(this)
    this.signOut = this.signOut.bind(this)
  }

  signIn() {
    this.setState({currentUser: true})
  }

  signOut() {
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'})
    fetch('/users/sign_out', {
      method: 'DELETE',
      headers: header,
      credentials: 'same-origin'
    }).then(response => {
      if (response.ok) {
        this.setState({currentUser: false});
      }
    })
  }

  render() {
    console.log(this.state);
    return(
      <Navbar>
        <Navbar.Header>
          <Navbar.Brand>
            <a href="/">On Blast</a>
          </Navbar.Brand>
        </Navbar.Header>

        <Nav pullRight>
          {this.state.currentUser && <NavItem eventKey={1} onClick={this.signOut}>Sign Out</NavItem>}
          {this.state.currentUser && <NavItem eventKey={2} href="/users/edit">My Account</NavItem>}
          {!this.state.currentUser && <NavItem eventKey={2} href="/users/sign_up">Sign Up</NavItem>}
          {!this.state.currentUser && <NavDropdown eventKey={4} title="Sign In" id="basic-nav-dropdown">
            <LoginForm signIn={this.signIn}/>
          </NavDropdown> }
        </Nav>
        <Navbar.Form>
          <FormGroup>
            <FormControl type="text" placeholder="Search" />
          </FormGroup>
          {' '}
          <Button type="submit">Submit</Button>
        </Navbar.Form>
      </Navbar>
    )
  }
}

export default Navigation;
