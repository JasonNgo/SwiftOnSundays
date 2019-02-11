//
//  MathyClassyTests.swift
//  MathyClassyTests
//
//  Created by Jason Ngo on 2019-02-11.
//  Copyright © 2019 Jason Ngo. All rights reserved.
//

import XCTest
@testable import MathyClassy

class MathyClassyTests: XCTestCase {
    
    func testQuestionOperandsWithinBounds() {
        let question = Question()
        XCTAssertGreaterThanOrEqual(question.leftOperand, 1)
        XCTAssertGreaterThanOrEqual(question.rightOperand, 1)
        XCTAssertLessThanOrEqual(question.leftOperand, 12)
        XCTAssertLessThanOrEqual(question.rightOperand, 12)
    }
    
    func testQuestionStringOutputIsFormattedForAdd() {
        let question = Question(leftOperand: 5, rightOperand: 5, operation: .add)
        let questionString = "What is 5 + 5?"
        XCTAssert(question.stringOutput == questionString)
    }
    
    func testQuestionStringOutputIsFormattedForSubtract() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .subtract)
        let questionString = "What is 10 - 5?"
        XCTAssert(question.stringOutput == questionString)
    }
    
    func testQuestionStringOutputIsFormattedForMultiply() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .multiply)
        let questionString = "What is 10 * 5?"
        XCTAssert(question.stringOutput == questionString)
    }
    
    func testQuestionNumberIsIncremented() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .multiply)
        let game = MathyClassy()
        let _ = game.process("5", for: question)
        XCTAssertEqual(game.questionNumber, 2)
    }
    
    func testQuestionScoreIsIncremented() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .multiply)
        let game = MathyClassy()
        let _ = game.process("50", for: question)
        XCTAssertEqual(game.score, 1)
    }
    
    func testAnswerValidationIsCorrectWithCorrectAnswer() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .multiply)
        let game = MathyClassy()
        let response = game.process("50", for: question)
        XCTAssertEqual(response, "Correct!")
    }
    
    func testAnswerValidationIsCorrectWithIncorrectAnswer() {
        let question = Question(leftOperand: 10, rightOperand: 5, operation: .multiply)
        let game = MathyClassy()
        let response = game.process("15", for: question)
        XCTAssertEqual(response, "Incorrect!")
    }
    
    func testGameCompletesAfterTenQuestions() {
        let game = MathyClassy()
        game.answerFunction = { return "556" }
        game.start()
        
        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }
    
}
