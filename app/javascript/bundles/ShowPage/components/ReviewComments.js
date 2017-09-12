import React from 'react';
import { Row } from 'react-bootstrap';
import ReviewComment from './ReviewComment';


const ReviewComments = (props) => {
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
}

export default ReviewComments;
