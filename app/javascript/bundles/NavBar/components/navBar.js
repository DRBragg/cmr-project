import React from 'react';
import { Navbar, FormGroup, FormControl, Button, Nav, NavDropdown, NavItem } from 'react-bootstrap';
import LoginForm from './LoginForm'

class Navigation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userLoggedin: false,
      currentUser: this.props.user
    }
  }

  render() {
    console.log(this.state);
    return(
      <Navbar>
        <Navbar.Header>
          <Navbar.Brand>
            <a href="#">On Blast</a>
          </Navbar.Brand>
        </Navbar.Header>
        <Navbar.Collapse>
          <Navbar.Form pullLeft>
            <FormGroup>
              <FormControl type="text" placeholder="Search" />
            </FormGroup>
            {' '}
            <Button type="submit">Submit</Button>
          </Navbar.Form>
        </Navbar.Collapse>
        <Nav pullRight>
          {this.state.user !== null && <NavItem eventKey={1} href="#">Sign Out</NavItem>}
          {this.state.user !== null && <NavItem eventKey={2} href="/users/edit">My Account</NavItem>}
          {!this.state.user && <NavItem eventKey={2} href="#">Sign Up</NavItem>}
          {!this.state.user && <NavDropdown eventKey={4} title="Sign In" id="basic-nav-dropdown">
            <LoginForm />
          </NavDropdown> }
        </Nav>
      </Navbar>
    )
  }
}

export default Navigation;
