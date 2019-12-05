//
//  Helpers.swift
//  BirdARGame
//
//  Created by vikas on 04/12/19.
//  Copyright © 2019 project1. All rights reserved.
//

import Foundation

enum GameState:Int {
    case none, spwanBirds
}

func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}

func randomNumber (lowerBound lower:Int, upperBound upper:Int) -> Int {
    return Int(arc4random()) / Int(UInt32.max) * (lower - upper) + upper
}
