import React from 'react';
import { Row } from 'react-bootstrap';
import RepImage from './RepImage';
import RepInfo from './RepInfo';


const RepData = (props) => {
  return(
    <Row>
      <RepImage url={props.rep.picture_url}/>
      <RepInfo rep={props.rep}/>
    </Row>
  )
}

export default RepData;
