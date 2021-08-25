//
//  Cell.swift
//  Three Men's Morris
//
//  Created by Sina on 2021-08-09.
//

import Foundation


struct Cell {
    
    enum state {
        case empty
        case X
        case O
    }
    
    var state: state = .empty
    var isSelected = false
}
