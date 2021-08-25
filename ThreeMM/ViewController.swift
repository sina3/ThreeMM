//
//  ViewController.swift
//  Three Men's Morris
//
//  Created by Sina on 2021-08-09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
        
    var game = ThreeMM(numberOfCells: 9)
    
    private func updateView() {
        
        for cellIndex in game.grid.indices {
            switch game.grid[cellIndex].state {
            case .empty: cells[cellIndex].setTitle("", for: .normal)
            case .X: cells[cellIndex].setTitle("❌", for: .normal)
            case .O: cells[cellIndex].setTitle("⭕️", for: .normal)
            }
            cells[cellIndex].backgroundColor = game.grid[cellIndex].isSelected ? #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1) : #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        }
        
        if game.winner == nil {
            switch ThreeMM.currentTurn {
            case .O:
                turn.text = "Player: ⭕️"
                turn.font = UIFont.systemFont(ofSize: 40)
            case .X:
                turn.text = "Player: ❌"
                turn.font = UIFont.systemFont(ofSize: 40)
            }
        } else {
           turn.text = "\(game.winner! == .X ? "❌" : "⭕️") WON!"
           turn.font = UIFont.systemFont(ofSize: 50)
        }
    }
    
    @IBAction func touchCell(_ sender: UIButton) {
        if let touchedCell = cells.firstIndex(of: sender) {
            game.touchCell(cellIndex: touchedCell)
        }
        updateView()
    }
        
    @IBOutlet var cells: [UIButton]! {
        didSet {
            cells.sort { $0.tag < $1.tag }
            for cell in cells {
                cell.layer.cornerRadius = 10
            }
        }
    }
    
    @IBOutlet weak var turn: UILabel!
    
    @IBAction func resetGame(_ sender: UIButton) {
        game.reset()
        updateView()
    }
    
    @IBAction func uniwindToGame(unwindSegue: UIStoryboardSegue) {}
    
    var players = ["❌", "⭕️"]

}

