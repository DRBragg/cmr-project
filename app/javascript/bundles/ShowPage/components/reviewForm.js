import React from 'react';
import {FormGroup, ControlLabel, FormControl, HelpBlock, Button, Col} from 'react-bootstrap';

class ReviewForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      headline: "",
      body: "",
      rating: "",
      userLogError: false
    }
    this.getValidationState = this.getValidationState.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  getValidationState(id){
    if (id === "headline") {
      const length = this.state.headline.length;
      if (length > 10 && length != 0 ) return 'success';
      else if (length < 10 && length != 0) return 'error';
      else if (length > 255) return 'error';
      else if (length === 0) return null;
    } else if (id === "body") {
      const length = this.state.body.length;
      if (length > 10 && length != 0 ) return 'success';
      else if (length < 10 && length != 0) return 'error';
      else if (length > 255) return 'error';
      else if (length === 0) return null;
    } else if (id === "rating"){
      const value = parseInt(this.state.rating);
      if (value === 0) return 'error';
      else if (value >= 1 && value < 6) return 'success';
      else return null;
    };
  }

  handleChange(e){
    let name = e.target.name
    let value = e.target.value
    this.setState({[name]: value})
  }

  handleSubmit(e){
    e.preventDefault();
    let formPayload = { review: {
      headline: this.state.headline,
      body: this.state.body,
      rating: parseInt(this.state.rating),
      representative_id: this.props.repId,
      user_id: this.props.userId
    }};
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'});
    fetch(window.location.pathname+'/reviews', {
      method: 'POST',
      headers: header,
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    }).then(response => {
      if (response.status == 401) {
        this.userNotSignedIn();
      } else {
        let newReview = response.json()
        return newReview
      }
    }).then(newReview => {
      this.props.newReview(newReview);
      this.clearForm()
    })
  }

  userNotSignedIn() {
    this.setState({userLogError: true})
  }

  clearForm(){
    this.setState({headline: "", body: "", rating: "", userLogError: false})
  }

  render() {
    let disabled;

    if (this.state.headline.length >= 10 && this.state.headline.length <= 255 && this.state.body.length >= 10 && this.state.body.length <= 255 && this.state.rating != "") {
      disabled = false
    } else {
      disabled = true
    }

    return (
      <Col xs={6} xsOffset={3}>
        <form className="background">
          <FormGroup
            controlId="formHeadlineText"
            validationState={this.getValidationState("headline")}
          >
            <ControlLabel>Headline</ControlLabel>
            <FormControl
              type="text"
              name='headline'
              value={this.state.headline}
              placeholder="Enter a headline for your review"
              onChange={this.handleChange}
            />
            <FormControl.Feedback />
            <HelpBlock>Headline must be between 10 - 255 characters.</HelpBlock>
          </FormGroup>

          <FormGroup
            controlId="formBodyText"
            validationState={this.getValidationState("body")}
          >
            <ControlLabel>Review</ControlLabel>
            <FormControl
              componentClass="textarea"
              name='body'
              value={this.state.body}
              placeholder="Write your review here"
              onChange={this.handleChange}
            />
            <FormControl.Feedback />
            <HelpBlock>Review must be between 10 - 255 characters.</HelpBlock>
          </FormGroup>

          <FormGroup
            controlId="formControlsSelect"
            validationState={this.getValidationState("rating")}
          >
            <ControlLabel>Rating</ControlLabel>
            <FormControl onChange = {this.handleChange} value={this.state.rating} name="rating" componentClass="select" placeholder="Rate this Representative">
              <option value="0">Rate this Representative</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </FormControl>
          </FormGroup>

          <Button type='submit' onClick={this.handleSubmit} disabled={disabled}>
            Submit
          </Button>
          {this.state.userLogError && <div className="alert alert-danger">You must be logged in to post!</div>}
        </form>
      </Col>
    );
  }
}

export default ReviewForm;
