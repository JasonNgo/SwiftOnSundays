//
//  MathyClassy.swift
//  MathyClassy
//
//  Created by Jason Ngo on 2019-02-11.
//  Copyright © 2019 Jason Ngo. All rights reserved.
//

import Foundation

class MathyClassy {
    var questionNumber = 1
    var score = 0
    var answerFunction = { readLine() }
    
    func process(_ answer: String, for question: Question) -> String {
        guard let intAnswer = Int(answer) else {
            return "Error!"
        }
        
        questionNumber += 1
        
        if intAnswer == question.correctAnswer {
            score += 1
            return "Correct!"
        } else {
            return "Incorrect!"
        }
    }
    
    func start() {
        print("Welcome to Mathy Classy!")
        
        repeat {
            let question = Question()
            print("\nQuestion \(questionNumber). \(question.stringOutput)")
            print("Your answer: ", terminator: "")
            
            if let answer = answerFunction() {
                print(process(answer, for: question))
            }
        } while questionNumber <= 10
        
        print("\nCongrats! You scored: \(score)\n")
    }
}
