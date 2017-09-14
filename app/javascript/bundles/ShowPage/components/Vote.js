import React from 'react';
import { Button, ButtonToolbar, Row, Col } from 'react-bootstrap';
import CommentPost from './commentPost'
import CommentForm from './commentForm'

class Vote extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      clicked: false,
      score: this.props.score
    }
    this.handleClick = this.handleClick.bind(this)
    this.handleUpvote = this.handleUpvote.bind(this)
    this.handleDownvote = this.handleDownvote.bind(this)
  }

  handleClick(e){
    e.preventDefault
    this.setState({clicked: true})
  }

  handleUpvote(e){
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'})
    let formPayload = {upvote: {review_id: this.props.reviewId, user_id: this.props.userId}}
    fetch('/api/v1/upvotes', {
      method: 'POST',
      headers: header,
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
      .then(response => {
      let newUpvote = response.json()
      return newUpvote })
      .then(newUpvote => {
        console.log(newUpvote);
        this.setState({score: newUpvote.score})
      })
  }

  handleDownvote(e){
    let header = ReactOnRails.authenticityHeaders({'Accept': 'application/json','Content-Type': 'application/json'})
    let formPayload = {downvote: {review_id: this.props.reviewId, user_id: this.props.userId}}
    fetch('/api/v1/downvotes', {
      method: 'POST',
      headers: header,
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
      .then(response => {
      let newDownvote = response.json()
      return newDownvote })
      .then(newDownvote => {
        console.log(newDownvote)
        this.setState({ score: newDownvote.score})
      })
  }

  render() {

    return(
      <Row>
        <Col xs={12}>
          <ButtonToolbar>
            <Button onClick={this.handleUpvote}>Upvote</Button>
            <h4> Score: {this.state.score} </h4>
            <Button onClick={this.handleDownvote}>Downvote</Button>
            <CommentPost
              onClick = {this.handleClick}
            />
              <Button bsStyle="primary" href={"/representatives/"+this.props.repId+"/reviews/"+this.props.reviewId+"/edit"}>Edit Review</Button>
          </ButtonToolbar>
        </Col>
        <Col xs={4}>
          {this.state.clicked && <CommentForm reviewId={this.props.reviewId} newComment={this.props.newComment} repId={this.props.repId} userId={this.props.userId}/>}
        </Col>
      </Row>
    )
  }
}

export default Vote;
