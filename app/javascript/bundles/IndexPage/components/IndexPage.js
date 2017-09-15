import React from 'react';
import { Grid, Row, Col, Button, Well } from 'react-bootstrap';
import CardsGroup from './CardsGroup';
import PageTitle from './PageTitle';


class IndexPage extends React.Component {
  render() {
    return(
      <Grid className="background">
        <Row className="text-center">
          <Col >
          </Col>
          <Col xs={10} md={6} lg={2} className="text-center">
            <PageTitle title={this.props.title} />
          </Col>
          <Col >
          </Col>
        </Row>
        <Row>
          <Col>
          </Col>
          <Col className="card-display">
            <CardsGroup reps={this.props.data} />
          </Col>
          <Col>
          </Col>
        </Row>
        <Row className="row-padding">
          <Col xs={12} className="text-center">
            <Button className="button" bsSize="large" href="/representatives/new">Add New Representative</Button>
          </Col>
        </Row>
      </Grid>
    )
  }
}

export default IndexPage;
