import React from 'react';
import {FormGroup, ControlLabel, FormControl, HelpBlock, Button} from 'react-bootstrap';
import ReactOnRails from 'react-on-rails';

class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      userLogError: false
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(e){
    let name = e.target.name
    let value = e.target.value
    this.setState({[name]: value})
  }

  handleSubmit(e){
    e.preventDefault()
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'})
    let formPayload = {user: {email: this.state.email, password: this.state.password}}
    fetch('/users/sign_in.json', {
      method: 'POST',
      headers: header,
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    }).then(response => {
      if (response.ok) {
        this.props.signIn();
      } else {
        this.setState({userLogError: true});
      }
    })
  }

  clearForm(){
    this.setState({username: '', password: '', userLogError: false})
  }

  render() {
    let disabled;

    if (this.state.username != '' && this.state.password != '') {
      disabled = false
    } else {
      disabled = true
    }

    return (
      <form>
        <FormGroup
          controlId="username"
        >
          <ControlLabel>Username</ControlLabel>
          <FormControl
            type="text"
            name="email"
            value={this.state.email}
            placeholder="Email"
            onChange={this.handleChange}
          />
        </FormGroup>
        <FormGroup
          controlId="password"
        >
          <ControlLabel>Password</ControlLabel>
          <FormControl
            type="password"
            name="password"
            value={this.state.password}
            placeholder="Password"
            onChange={this.handleChange}
          />
        </FormGroup>
        <Button type='submit' onClick = {this.handleSubmit} disabled={disabled}>
          Sign In
        </Button>
        {this.state.userLogError && <div className="alert alert-danger">Incorrect Username/Password</div>}
      </form>
    );
  }
}

export default LoginForm;
