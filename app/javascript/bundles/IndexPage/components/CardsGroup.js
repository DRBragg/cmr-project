import React from 'react';
import { Row } from 'react-bootstrap';
import RepCard from './RepCard';


const CardsGroup = (props) => {
  let cards = props.reps.map(rep => {
    return(
      <RepCard key={rep.id} rep={rep} />
    )
  })

  return(
    <div>
      {cards}
    </div>
  )
}

export default CardsGroup
