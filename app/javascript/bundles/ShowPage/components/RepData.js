import React from 'react';
import { Row } from 'react-bootstrap';
import RepImage from './RepImage';
import RepInfo from './RepInfo';


const RepData = (props) => {
  return(
    <Row className="background">
      <RepImage url={props.rep.picture_url} />
      <RepInfo rep={props.rep} newReview={props.newReview} userId={props.userId} />
    </Row>
  )
}

export default RepData;
