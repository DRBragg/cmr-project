import React from 'react';
import { Link } from 'react-router';


class RepresentativesIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selected_id: null,
      representatives: []
    }
  }

  componentDidMount() {

  }


  render() {
    let representatives =
    this.state.representatives.map((representative) => {
      return(
        <Link to={`/representatives/${representative.id}`} key={representative.id}>
          {representative.first_name}
        </Link>
      )
    })

    return (
      <div className="RepresentativesIndexContainer">
        <p>{representatives}</p>

      </div>
    );
  }
}

export default RepresentativesIndexContainer;
