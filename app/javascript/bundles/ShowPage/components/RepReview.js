import React from 'react';
import { Row, Col, Panel } from 'react-bootstrap';
import Vote from './Vote';
import CommentPost from './commentPost';


const RepReview = (props) => {
  const head = (
    <h3>{props.review.headline} Rating: {props.review.rating}/5</h3>
  );

  const foot = (
    <Vote
    reviewId={props.review.id}
    userId={props.userId}
    newComment={props.newComment}
    repId={props.repId}
    />
  );
  return(
    <Row>
      <Col xs={12}>
        <Panel
          header={head}
          footer={foot}>
        {props.review.body}
        </Panel>
      </Col>
    </Row>
  )
}
export default RepReview
