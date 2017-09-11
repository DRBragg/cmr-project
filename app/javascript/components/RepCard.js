import React from 'react';
import { Col, Panel, Button } from 'react-bootstrap';


const RepCard = (props) => {
  return(
    <Col md={4} className="text-center">
      <Panel header={props.rep.first_name}>
        <img src={props.rep.picture_url} alt={props.rep.last_name} className="img-circle"/>
        <br />
        <Button bsStyle="primary">Review this Rep</Button>
      </Panel>
    </Col>
  )
}

export default RepCard
