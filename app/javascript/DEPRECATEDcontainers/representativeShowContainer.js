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

  }

  render() {
    return (
      <div className="RepresentativeShowContainer">

      <ReviewsContainer
      />
      </div>
    );
  }
}

export default RepresentativeShowContainer;
