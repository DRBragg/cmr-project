import React from 'react';
import { Row, Col } from 'react-bootstrap';


const PageTitle = (props) => {
  return(
    <Row>
      <Col xs={12} className="text-center">
        <h1 className="rep-title">{props.title}</h1>
      </Col>
    </Row>
  )
}

export default PageTitle;
