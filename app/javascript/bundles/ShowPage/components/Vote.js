import React from 'react';
import { Button, ButtonToolbar, Row, Col } from 'react-bootstrap';
import CommentPost from './commentPost'
import CommentForm from './commentForm'

class Vote extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      clicked: false
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e){
    e.preventDefault
    this.setState({clicked: true})
  }

  render() {

    return(
      <Row>
        <Col xs={12}>
          <ButtonToolbar>
            <Button>Upvote</Button>
            <Button>Downvote</Button>
            <CommentPost
              onClick = {this.handleClick}
            />
            {this.props.user && <Button>
              Edit Review
            </Button>
          }
          </ButtonToolbar>
        </Col>
        <Col xs={4}>
          {this.state.clicked && <CommentForm reviewId={this.props.reviewId}/>}
        </Col>
      </Row>
    )
  }
}

export default Vote;
