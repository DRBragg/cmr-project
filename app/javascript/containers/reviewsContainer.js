import React from 'react';
import ReviewComponent from '../components/reviewComponent'

class ReviewsContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }
  componentDidMount() {

  }

  render() {
    let reviews = this.props.reviews.map(review => {
      return(
        <ReviewComponent
        />
      )
    })
    return (
      <div className="ReviewsContainer">
        <h1>{reviews}</h1>
      </div>
    );
  }
}

export default ReviewsContainer;
