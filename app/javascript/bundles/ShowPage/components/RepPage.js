import React from 'react';
import { Grid } from 'react-bootstrap';
import PageTitle from './PageTitle';
import RepData from './RepData';
import RepReviews from './RepReviews';
import ReviewForm from './reviewForm'

class RepPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rep: this.props.rep,
      reviews: this.props.reviews,
      comments: this.props.comments
    }
    this.handleNewReview = this.handleNewReview.bind(this);
    this.handleNewComment = this.handleNewComment.bind(this);
  }

  handleNewReview(data) {
    let allReviews = this.state.reviews
    let updatedReviews = allReviews.concat([data])
    this.setState({reviews: updatedReviews})
  }

  handleNewComment(data, id) {
    let allComments = this.state.comments
    allComments[id].concat([data])
    this.setState({comments: allComments})
  }

  render() {
    return(
      <Grid>
        <PageTitle title={this.state.rep.first_name + " " + this.state.rep.last_name} />
        <RepData rep={this.state.rep} newReview={this.handleNewReview} />
        <RepReviews newComment={this.handleNewComment} reviews={this.state.reviews} comments={this.state.comments} user={this.props.user}/>
      </Grid>
    )
  }
}

export default RepPage;
