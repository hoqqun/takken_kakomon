import React from 'react';
import logo from './logo.svg';
import './App.css';
import Button from '@material-ui/core/Button';
import { Query } from 'react-apollo';
import { ApolloProvider } from "react-apollo";
import gql from 'graphql-tag';
import ApolloClient from 'apollo-boost';
import Questions from './questions.js';
import { csrfToken } from 'rails-ujs';

const client = new ApolloClient({ uri: "http://localhost:3001/graphql" })
const GET_QUESTION = gql`
 query($id: Int) {
   user(id: $Id) {
     statement
   }
 }
`;

function App() {
  return (
    <div className="App">
      <Button variant="contained" color="primary">
        Hello World
      </Button>

      <ApolloProvider client={client}>
        <div>
          <h2>My first Apollo app</h2>
          <Questions />
        </div>
      </ApolloProvider>
    </div>
  );
}

export default App;
