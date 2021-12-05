//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Nassir Bouredenna on 04/12/2021.
//  Copyright © 2021 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    func setPlayerOneScore(_ score: Int) {
        game.scores[.one] =  score
    }

    func testGivenScoreIsNull_WhenIncrementingPlayer1score_ThenScoreShouldBeFifteen() {
        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsFifteen_WhenIncrementingPlayer1score_ThenScoreShouldBeThirty() {
        setPlayerOneScore(15)

        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsThirty_WhenIncrementingPlayer1score_ThenScoreShouldBeForty() {
        setPlayerOneScore(30)

        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 40)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsForty_WhenIncrementingPlayer1score_ThenGameIsOverAndWonByPlayer1() {
        setPlayerOneScore(40)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }
}
