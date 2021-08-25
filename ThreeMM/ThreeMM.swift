//
//  ThreeMM.swift
//  Three Men's Morris
//
//  Created by Sina on 2021-08-09.
//

import Foundation

class ThreeMM {
    
    enum playTurn {
        case X
        case O
    }
    
    static func randomTurn() -> playTurn {
        let all: [playTurn] = [.O, .X]
        
        let randomIndex = Int(arc4random()) % all.count
        return all[randomIndex]
    }
    
    static var currentTurn = randomTurn()
    var grid = [Cell]()
    var XCount: Int
    var OCount: Int
    var selectedCell: Int?
    var winner: playTurn?
    
    init(numberOfCells number: Int) {
        XCount = 0
        OCount = 0
        winner = nil
        selectedCell = nil
        for _ in 0..<number {
            let newCell = Cell()
            grid += [newCell]
        }
        
    }
    
    private func selectCell(at cellIndex: Int) {
        for cell in grid.indices {
            if cell == cellIndex {
                grid[cell].isSelected = true
                selectedCell = cell
            } else {
                grid[cell].isSelected = false
            }
        }
    }
    
    private func deselectCell(for cellIndex: Int) {
        grid[cellIndex].isSelected = false
    }

    private func moveCell(to cell: Int, with mark: Cell.state) {
        if let fromCell = selectedCell {
            grid[cell].state = mark
            grid[fromCell].state = .empty
            grid[fromCell].isSelected = false

        }
    }
    
    func reset() {
        for cell in grid.indices {
            grid[cell].state = .empty
            XCount = 0
            OCount = 0
            selectedCell = nil
            winner = nil
            ThreeMM.currentTurn = ThreeMM.randomTurn()
        }
    }

    func touchCell(cellIndex: Int) {
        if winner == nil {
            switch ThreeMM.currentTurn {
            case .X:
                
                switch grid[cellIndex].state {
                case .empty:
                    if XCount < 3 {
                        grid[cellIndex].state = .X
                        ThreeMM.currentTurn = .O
                        XCount += 1
                    } else if selectedCell != nil {
                            moveCell(to: cellIndex, with: .X)
                            selectedCell = nil
                            ThreeMM.currentTurn = .O
                    }
                case .X:
                    if cellIndex == selectedCell {
                        deselectCell(for: cellIndex)
                        selectedCell = nil
                    } else {
                        selectCell(at: cellIndex)

                    }
                default:
                    break
                }

            case .O:
                
                switch grid[cellIndex].state {
                case .empty:
                    if OCount < 3 {
                        grid[cellIndex].state = .O
                        OCount += 1
                        ThreeMM.currentTurn = .X
                    } else if selectedCell != nil {
                        moveCell(to: cellIndex, with: .O)
                        selectedCell = nil
                        ThreeMM.currentTurn = .X
                    }
                case .O:
                    if cellIndex == selectedCell {
                        deselectCell(for: cellIndex)
                        selectedCell = nil
                    } else {
                        selectCell(at: cellIndex)
                    }
                default:
                    break
                }

            }
        }
        evaluateGrid()
    }
    private func evaluateGrid() {
        let winningSets = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        var playedSet = [Cell.state]()
        
        for set in winningSets {
            for cellIndex in set {
                playedSet += [grid[cellIndex].state]
            }
            if playedSet[0] == .X, playedSet[1] == .X, playedSet[2] == .X {
                winner = .X
            } else if playedSet[0] == .O, playedSet[1] == .O, playedSet[2] == .O {
                winner = .O
            } else {
                playedSet = [Cell.state]()
            }
        }
    }
}
