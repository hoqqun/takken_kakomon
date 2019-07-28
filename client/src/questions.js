import React from "react";
import { Query } from "react-apollo";
import gql from "graphql-tag";
import axios from "axios";

class Questions extends React.component {
  constructor(props) {
    super(props)
    this.state = {
      questions: []
    }
  }
  componentDidMount() {
    axios.get('http://localhost:3001/api/v1/questions')
    .then((results) => {
      console.log(results)
      this.setState({questions: results.data})
    })
    .catch((data) =>{
      console.log(data)
    })
  }

  render() {
    return (
      <div className="app-main">
        { this.state.questions }
      </div>
    )
  }
}
//const Questions = () => (
  // <Query
  //   query={
  //     /* GraphQLのクエリ */
  //     gql`
  //       {
  //         question(id: 1) {
  //           statement
  //           explanation
  //           correctness
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
//);
export default Questions;
