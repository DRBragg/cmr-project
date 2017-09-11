// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import RepPage from '../components/RepPage'
import IndexPage from '../components/IndexPage'

let data = {
  title: "Representatives",
  reps: [
    {
      name: "Test Guy",
      picture_url: "http://via.placeholder.com/250x250"
    },
    {
      name: "Next Guy",
      picture_url: "http://via.placeholder.com/250x250"
    },
    {
      name: "Another Guy",
      picture_url: "http://via.placeholder.com/250x250"
    },
    {
      name: "Girl Guy",
      picture_url: "http://via.placeholder.com/250x250"
    }
  ]
}

let rep = {
  name: "Test Guy",
  picture_url: "http://via.placeholder.com/250x250",
  office: "Mayor",
  email: "mayor@city.com",
  party: "Democrat",
  bio: "This is our test rep. Isn't he cool?!",
  elected: "09/01/2017",
  phone_number: "1234567890",
  reviews: [
    {
      headline: "Test Review 1",
      body: "This is just a test review, nothing to see here!",
      rating: 3,
      comments: [
        {
          body: "just a test comment"
        },
        {
          body: "another comment"
        }
      ]
    },
    {
      headline: "Test Review 2",
      body: "This is just another test review, nothing to see here!",
      rating: 4,
      comments: [
        {
          body: "just a test comment"
        },
        {
          body: "another comment"
        }
      ]
    },
    {
      headline: "Test Review 3",
      body: "This is just the last test review, nothing to see here!",
      rating: 5,
      comments: [
        {
          body: "just a test comment"
        },
        {
          body: "another comment"
        }
      ]
    }
  ]
}

let reviews = [
  {
    headline: "Test Review 1",
    body: "This is just a test review, nothing to see here!",
    rating: 3
  },
  {
    headline: "Test Review 2",
    body: "This is just another test review, nothing to see here!",
    rating: 4
  },
  {
    headline: "Test Review 3",
    body: "This is just the last test review, nothing to see here!",
    rating: 5
  }
]

let review = {
  headline: "Test Review",
  body: "This is just a test review, nothing to see here!",
  rating: 3
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <IndexPage data={data}/>,
    document.body.appendChild(document.createElement('div')),
  )
})
