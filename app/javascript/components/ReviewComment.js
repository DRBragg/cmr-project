import React from 'react';
import { Col, Well } from 'react-bootstrap';


const ReviewComment = (props) => {
  return(
    <Col xs={10} xsOffset={1}>
      <Well>
        {props.comment.body}
      </Well>
    </Col>
  )
}

export default ReviewComment;
