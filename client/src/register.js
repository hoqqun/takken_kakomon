import React from "react";
import { Mutation } from "react-apollo";
import gql from "graphql-tag";
import { Input } from "@material-ui/core";

const ADD_QUESTION = gql`
mutation {
  createQuestion(input: {
    statement
    explanation
    questionNumber
    questionBranchNumber
    correctness
  })
}`;

const Register = () => {
  let input;

  return (
    <Mutation mutation={ADD_QUESTION}>
      {(createQuestion, { data }) => (
        <div>
          <form
            onSubmit={e => {
              e.preventDefault();
              createQuestion({ variables: {
                type: input.value
              }});
              input.value = "";
            }}
          >
            <input ref={node => {
              input = node;
            }}
            />
            <button type="submit">Create Question</button>
          </form>
        </div>
      )}
    </Mutation>
  );
};

  // <Query
  //   query={
  //     /* GraphQLのクエリ */
  //     gql`
  //       mutation {
  //         createQuestion(input: {
  //           statement
  //           explanation
  //           correctness
  //           questionNumber
  //           questionBranchNumber
  //           correctness
  //         })
  //         {
  //           question {
  //             id
  //             statement
  //             explanation
  //           }
  //         }
  //       }
  //     `
  //   }
  // >
  //   {/* GraphQLのクエリの実行結果の処理、成功したら結果を表示 */}
  //   {({ loading, error, data }) => {
  //     if (loading) return <p>Loading...</p>;
  //     if (error) return <p>Error</p>;
  //     return (
  //       <div>
  //         <p>{data.question.explanation}</p>
  //       </div>
  //     );
  //   }}
  // </Query>
export default Register;
