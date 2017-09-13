import React from 'react';
import { Row, Grid } from 'react-bootstrap';
import RepReview from './RepReview';
import ReviewComments from './ReviewComments';


const RepReviews = (props) => {
  let repReviews = props.reviews.map(review => {
    let reviewID = review.id
    return(
      <Grid key={review.id}>
        <RepReview
          review={review}
          user={props.user}
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
}

export default RepReviews
