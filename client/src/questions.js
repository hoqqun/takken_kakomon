import React from "react";
import { Query } from "react-apollo";
import gql from "graphql-tag";

const Questions = () => (
  <Query
    query={
      /* GraphQLのクエリ */
      gql`
        {
          questions {
            statement
            explanation
            correctness
          }
        }
      `
    }
  >
    {/* GraphQLのクエリの実行結果の処理、成功したら結果を表示 */}
    {({ loading, error, data }) => {
      if (loading) return <p>Loading...</p>;
      if (error) return <p>Error</p>;
      return data.questions.map(question => (
        <div key={question.id}>
          <p>statement: {`${question.statement}`}</p>
          <p>explanation: {`${question.explanation}`}</p>
          <p>correctness: {`${question.correctness}`}</p>
          <hr />
        </div>
      ));
    }}
  </Query>
);
export default Questions;
