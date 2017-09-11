/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import RepresentativesIndexContainer from '../containers/RepresentativesIndexContainer';
import RepresentativeShowContainer from '../containers/RepresentativeShowContainer';
import ReviewsContainer from '../containers/reviewsContainer';

class Application extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    }
  }

  render() {

    return (
      <Router history={browserHistory}>
        <Route path="/" >
          <IndexRoute component={RepresentativesIndexContainer}/>
          <Route path="/representatives" component={RepresentativesIndexContainer}/>
          <Route path="/representatives/:id" component={RepresentativeShowContainer}/>
        </Route>
      </Router>

    );
  }
}

export default Application;
