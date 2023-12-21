//
//  GridViewModel.swift
//  ghost-police
//
//  Created by Ikroop Singh Kalsi on 21/12/23.
//

import Foundation

@Observable
class GridViewModel {
    let rows: Int
    let columns: Int
    
    private (set) var ghostCoordinate: Coordinate
    private (set) var policeCoordinate: Coordinate
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        
        let gc = Coordinate.random(rows, columns)
        ghostCoordinate = gc
        policeCoordinate = gc.generateRandomNonOverlapping(rows, columns)
    }
    
    func randomizeGhostCoordinates() {
        var c = Coordinate.random(rows, columns)
        while c == ghostCoordinate || c == policeCoordinate {
            c = Coordinate.random(rows, columns)
        }
        ghostCoordinate = c
    }
    
    func randomizePoliceCoordinates() {
        var c = ghostCoordinate.generateRandomNonOverlapping(rows, columns)
        while c == policeCoordinate {
            c = ghostCoordinate.generateRandomNonOverlapping(rows, columns)
        }
        policeCoordinate = c
    }
}

extension GridViewModel: Hashable {
    static func == (lhs: GridViewModel, rhs: GridViewModel) -> Bool {
        lhs.rows == rhs.rows && lhs.columns == rhs.columns
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rows)
        hasher.combine(columns)
    }
}
