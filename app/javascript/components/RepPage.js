import React from 'react';
import { Grid } from 'react-bootstrap';
import PageTitle from './PageTitle';
import RepData from './RepData';
import RepReviews from './RepReviews';


const RepPage = (props) => {
  return(
    <Grid>
      <PageTitle title={props.rep.name} />
      <RepData rep={props.rep}/>
      <RepReviews reviews={props.rep.reviews}/>
    </Grid>
  )
}

export default RepPage;
