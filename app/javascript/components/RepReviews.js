import React from 'react';
import { Row, Grid } from 'react-bootstrap';
import RepReview from './RepReview';
import ReviewComments from './ReviewComments';



const RepReviews = (props) => {
  let repReviews = props.reviews.map(review => {
    return(
      <Grid>
        <RepReview review={review} />
        <ReviewComments comments={review.comments}/>
      </Grid>
    )
  })

  return(
    <Row>
      {repReviews}
    </Row>
  )
}

export default RepReviews
