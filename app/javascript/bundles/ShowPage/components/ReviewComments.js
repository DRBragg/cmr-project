import React from 'react';
import { Row } from 'react-bootstrap';
import ReviewComment from './ReviewComment';


const ReviewComments = (props) => {
  if (props.comments != undefined) {
    let reviewComments = props.comments.map(comment => {
      return(
        <ReviewComment key={comment.id} comment={comment} />
      )
    })

    return(
      <Row>
        {reviewComments}
      </Row>
    )
  } else {
    return(
      <Row>
      </Row>
    )
  }
}

export default ReviewComments;
