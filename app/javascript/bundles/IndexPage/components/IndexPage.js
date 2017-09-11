import React from 'react';
import { Grid } from 'react-bootstrap';
import CardsGroup from './CardsGroup';
import PageTitle from './PageTitle';


class IndexPage extends React.Component {
  render() {
    console.log("IndexPage");
    return(
      <Grid>
        <PageTitle title={this.props.title} />
        <CardsGroup reps={this.props.data} />
      </Grid>
    )
  }
}

export default IndexPage;
