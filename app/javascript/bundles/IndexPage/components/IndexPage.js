import React from 'react';
import { Grid, Row, Col, Button } from 'react-bootstrap';
import CardsGroup from './CardsGroup';
import PageTitle from './PageTitle';


class IndexPage extends React.Component {
  render() {
    console.log("IndexPage");
    return(
      <Grid>
        <PageTitle title={this.props.title} />
        <CardsGroup reps={this.props.data} />
        <Row>
          <Col xs={10} xsOffset={1} className="text-center">
            <Button bsSize="large" href="/representatives/new">Add New Representative</Button>
          </Col>
        </Row>
      </Grid>
    )
  }
}

export default IndexPage;
