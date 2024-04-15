//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by Daria Granina on 15.04.2024.
//

import Foundation
import XCTest
@testable import MovieQuiz

final class ArrayTests: XCTestCase {
    func testGetValueInRange() throws { // успешное взятие элемента по индексу
        // Given
        let array = [1, 1, 2, 3, 5]
        
        // When
        let value = array[safe: 2]
        
        // Then
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
    }
    func testGetValueOutOfRange() throws { // взятие эл. по неправильному индексу
        // Given
        let array = [1, 1, 2, 3, 5]
        
        // When
        let value = array[safe: 20]
        
        // Then
        XCTAssertNil(value)
    }
}
