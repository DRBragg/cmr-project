import React from 'react';
import { Grid, Row, Col, Button, Well } from 'react-bootstrap';
import CardsGroup from './CardsGroup';
import PageTitle from './PageTitle';


class IndexPage extends React.Component {
  render() {
    return(
      <Grid className="background">
        <Row>
          <Col xs={12} className="text-center">
            <PageTitle title={this.props.title} />
          </Col>
        </Row>
        <Row>
          <CardsGroup reps={this.props.data} />
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
