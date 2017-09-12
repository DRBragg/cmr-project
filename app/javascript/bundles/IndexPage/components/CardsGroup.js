import React from 'react';
import { Row } from 'react-bootstrap';
import RepCard from './RepCard';


const CardsGroup = (props) => {
  let cards = props.reps.map(rep => {
    return(
      <RepCard rep={rep} />
    )
  })

  return(
    <Row>
      {cards}
    </Row>
  )
}

export default CardsGroup
