import React from 'react';
import { Col, Panel, Button } from 'react-bootstrap';


const RepCard = (props) => {
  let name = props.rep.first_name  + " " + props.rep.last_name
  return(
    <Col md={4} className="text-center">
      <Panel header={name}>
        <img src={props.rep.picture_url} alt={props.rep.last_name} className="img-circle"/>
        <br />
        <Button bsStyle="primary">View Rep</Button>
      </Panel>
    </Col>
  )
}

export default RepCard
