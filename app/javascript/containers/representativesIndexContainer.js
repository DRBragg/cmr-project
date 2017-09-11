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
    fetch('/api/v1/representatives')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        representatives: body
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));

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
        <h1>REPRESENTATIVES CONTAINER!!!!</h1>
        <p>{representatives}</p>

      </div>
    );
  }
}

export default RepresentativesIndexContainer;
