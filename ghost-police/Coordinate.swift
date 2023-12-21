//
//  Coordinate.swift
//  ghost-police
//
//  Created by Ikroop Singh Kalsi on 21/12/23.
//

import Foundation

struct Coordinate: Equatable, CustomStringConvertible {
    let x: Int
    let y: Int
    
    let description: String
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
        self.description = "(\(x), \(y))"
    }
}

extension Coordinate {
    static func random(_ rows: Int, _ columns: Int) -> Coordinate {
        Coordinate(Int.random(in: 0..<rows), Int.random(in: 0..<columns))
    }
    
    func generateRandomNonOverlapping(_ rows: Int, _ columns: Int) -> Coordinate {
        var nonOverlappingCoord = Coordinate.random(rows, columns)
        while nonOverlappingCoord.x == x || nonOverlappingCoord.y == y {
            nonOverlappingCoord = Coordinate.random(rows, columns)
        }
        return nonOverlappingCoord
    }
}
