import React from 'react';
import {FormGroup, ControlLabel, FormControl, HelpBlock, Button} from 'react-bootstrap';
import ReactOnRails from 'react-on-rails';

class CommentForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: "",
      userLogError: false
    }
    this.getValidationState = this.getValidationState.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  getValidationState(){
    const length = this.state.value.length;
    if (length > 10 && length != 0 ) return 'success';
    else if (length < 10 && length != 0) return 'error';
    else if (length > 255) return 'error';
    else if (length === 0) return null;
  }

  handleChange(e){
    this.setState({value: e.target.value})
  }

  handleSubmit(e){
    e.preventDefault()
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'})
    let formPayload = {comment: {body: this.state.value, review_id: this.props.reviewId, user_id: this.props.userId}}
    fetch('/representatives/'+this.props.repId+'/reviews/'+this.props.reviewId+'/comments.json', {
      method: 'POST',
      headers: header,
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    }).then(response => {
      if (response.status == 401) {
        this.userNotSignedIn();
      } else {
        let newComment = response.json()
        return newComment
      }
    }).then(newComment => {
      this.props.newComment(newComment, this.props.reviewId)
      this.clearForm()
    })
  }

  userNotSignedIn() {
    this.setState({userLogError: true})
  }

  clearForm(){
    this.setState({value: '', userLogError: false})
  }


  render() {
    let disabled;

    if (this.state.value.length >= 10 && this.state.value.length <= 255) {
      disabled = false
    } else {
      disabled = true
    }
    return (
      <form className="background">
        <FormGroup
          controlId="formBasicText"
          validationState={this.getValidationState()}
        >
          <ControlLabel>Comment</ControlLabel>
          <FormControl
            type="text"
            value={this.state.value}
            placeholder="Enter Comment"
            onChange={this.handleChange}
          />
          <FormControl.Feedback />
          <HelpBlock>Comment must be between 10 - 255 characters.</HelpBlock>
        </FormGroup>
        <Button type='submit' onClick = {this.handleSubmit} disabled={disabled}>
          Submit
        </Button>
        {this.state.userLogError && <div className="alert alert-danger">You must be logged in to comment!</div>}
      </form>
    );
  }
}

export default CommentForm;
