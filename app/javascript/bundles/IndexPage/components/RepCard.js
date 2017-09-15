import React from 'react';
import { Col, Panel, Button } from 'react-bootstrap';


const RepCard = (props) => {
  return(
          <Col md={3} className="text-center padding">
            <Panel header={props.rep.first_name  + " " + props.rep.last_name}>
              <img src={props.rep.picture_url} alt={props.rep.last_name} className="img-circle card-image"/>
              <br />
              <Button bsStyle="warning" href={"/representatives/" + props.rep.id}>View Rep</Button>
            </Panel>
          </Col>
  )
}

export default RepCard
