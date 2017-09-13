import React from 'react';
import { Grid } from 'react-bootstrap';
import PageTitle from './PageTitle';
import RepData from './RepData';
import RepReviews from './RepReviews';
import ReviewForm from './reviewForm'

const RepPage = (props) => {
  return(
    <Grid>
      <PageTitle title={props.rep.first_name + " " + props.rep.last_name} />
      <RepData rep={props.rep}, userId={props.user.id}/>
      <RepReviews reviews={props.reviews} comments={props.comments} user={props.user}/>
    </Grid>
  )
}

export default RepPage;
