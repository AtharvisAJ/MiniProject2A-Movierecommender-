import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import {BrowserRouter} from 'react-router-dom';

function App() {

  const questions = [
    {
      questionText: 'What is your preferred Genre',
      answerOptions: [
        { answerText: 'Horror', isCorrect: false },
        { answerText: 'Comedy', isCorrect: false },
        { answerText: 'Romance', isCorrect: true },
        { answerText: 'Action', isCorrect: false },
      ],
    },
    {
      questionText: 'What is your second favorite Genre',
      answerOptions: [
        { answerText: 'Horror', isCorrect: false },
        { answerText: 'Comedy', isCorrect: false },
        { answerText: 'Romance', isCorrect: true },
        { answerText: 'Action', isCorrect: false },
      ],
    },
    {
      questionText: 'Who is your Favorite Director?',
      answerOptions: [
        { answerText: 'Quintin Tarrentino', isCorrect: false },
        { answerText: 'Christopher Nolan', isCorrect: true },
        { answerText: 'Wes Anderson', isCorrect: false },
        { answerText: 'Martin Scorcesse', isCorrect: false },
      ],
    },
    {
      questionText: 'What Language do you watch the movies in?',
      answerOptions: [
        { answerText: 'Hindi', isCorrect: false },
        { answerText: 'English', isCorrect: true },
      ],
    },
    {
      questionText: 'Hoe many Movies have you watched?',
      answerOptions: [
        { answerText: 'More than 10', isCorrect: false },
        { answerText: 'More than 20', isCorrect: false },
        { answerText: 'More than 50', isCorrect: false },
        { answerText: 'More than 100', isCorrect: true },
      ],
    },
  ]

  const [currentQuestion, setCurrentQuestion] = useState(0)
  const [showScore, setShowScore] = useState(false)
  const [score, setScore] = useState(0)
  const handleAnswerButtonClick = () => {
    

    const nextQuetions = currentQuestion + 1;
    
    if (nextQuetions < questions.length) {
      setCurrentQuestion(nextQuetions);
    }
    else {
      setShowScore(true)
    }
  }

   

  return (
    <>
      <h1 className='header'>Quiz</h1>
      <div className="app">
        {showScore ? (
          <div className='score-section'>
            <div><a href='http://127.0.0.1:5000/index'>Your Preferences have been noted.<br />Click here to see your movie<br/> recommendations</a></div>
          </div>
        )
          :
          (
            <>
              <div className='question-section'>
                <div className='question-count'>
                  <span>Question {currentQuestion + 1}</span>{questions.length}
                </div>
                <div className='question-text'>
                  {questions[currentQuestion].questionText}
                </div>
              </div>

              <div className='answer-section'>
                {
                  questions[currentQuestion].answerOptions.map((answerOptions) => (
                    <a href={"http://127.0.0.1:5000/quiz?answer="+answerOptions.answerText}><button onClick={() => handleAnswerButtonClick()}>{answerOptions.answerText}</button></a>
                  ))

                }
                
              </div>
            </>
          )}
      </div>
    </>
  );
}

export default App;