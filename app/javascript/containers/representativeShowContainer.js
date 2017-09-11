import React from 'react';
import ReviewsContainer from './reviewsContainer';

class RepresentativeShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      representative: {},
      reviews: []
    }
  }
  componentDidMount() {
    fetch(`/api/v1/representatives/${this.props.params.id}`)
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
        representative: body
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));

    fetch(`/api/v1/representatives/${this.props.params.id}/reviews`)
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
        reviews: body
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));


  }

  render() {
    return (
      <div className="RepresentativeShowContainer">
      {this.state.representative.first_name}
      {this.state.representative.id}

      <ReviewsContainer
        representativeId = {this.props.params.id}
        reviews = {this.state.reviews}
      />
      </div>
    );
  }
}

export default RepresentativeShowContainer;
