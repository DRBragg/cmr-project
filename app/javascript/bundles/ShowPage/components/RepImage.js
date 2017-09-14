import React from 'react';
import { Col } from 'react-bootstrap';


const RepImage = (props) => {
  return(
    <Col xs={12} className="text-center">
      <img src={props.url} alt="Rep Image" className="img-circle" />
    </Col>
  )
}

export default RepImage;
