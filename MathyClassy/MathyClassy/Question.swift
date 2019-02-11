//
//  Question.swift
//  MathyClassy
//
//  Created by Jason Ngo on 2019-02-11.
//  Copyright © 2019 Jason Ngo. All rights reserved.
//

import Foundation

struct Question {
    let leftOperand: Int
    let rightOperand: Int
    let operation: QuestionType
    
    var stringOutput: String {
        switch operation {
        case .add:
            return "What is \(leftOperand) + \(rightOperand)?"
        case .subtract:
            return "What is \(leftOperand) - \(rightOperand)?"
        case .multiply:
            return "What is \(leftOperand) * \(rightOperand)?"
        }
    }
    
    var correctAnswer: Int {
        switch operation {
        case .add:
            return leftOperand + rightOperand
        case .subtract:
            return leftOperand - rightOperand
        case .multiply:
            return leftOperand * rightOperand
        }
    }
}

extension Question {
    init() {
        leftOperand = Int.random(in: 1...12)
        rightOperand = Int.random(in: 1...12)
        operation = QuestionType.allCases.randomElement()!
    }
}
