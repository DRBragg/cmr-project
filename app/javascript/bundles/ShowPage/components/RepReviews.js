import React from 'react';
import { Row, Grid } from 'react-bootstrap';
import RepReview from './RepReview';
import ReviewComments from './ReviewComments';


const RepReviews = (props) => {
  if (props.reviews != null) {
    let repReviews = props.reviews.map(review => {
      let reviewID = review.id
      return(
        <Grid key={review.id}>
          <RepReview
            review={review}
            user={props.user}
            userId={props.userId}
            newComment={props.newComment}
            repId={props.repId}
           />
          <ReviewComments comments={props.comments[reviewID]}/>
        </Grid>
      )
    })

    return(
      <Row>
        {repReviews}
      </Row>
    )
  } else {
    return(
      <Row>
      </Row>
    )
  }
}

export default RepReviews
