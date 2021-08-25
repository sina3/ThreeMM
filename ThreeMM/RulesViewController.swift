//
//  RulesViewController.swift
//  Three Men's Morris
//
//  Created by Sina on 2021-08-23.
//

import UIKit

class RulesViewController: UIViewController {
    
    let headline = "Three Men's Morris\n"

    let rulesTitle = "Rules: \n"

    let rules = "- Each player has only three pieces (Xs or Os) to place on the grid in trying to first align their pieces on a straight line on the grid. The line can be horizontal, vertical, or diagonal.\n- The beginning player is randomly selected at the start of each game.\n"
    
    let howTitle = "How to play: \n"
    
    let howText = "- Place a piece on the grid by touching any empty cell.\n- To move a piece, touch its cell to highlight it and then touch the empty destination cell.\n\n"

    let endingText = "This is a project in progress. More features will be added to the game in the future.\nPlease send any feedback or suggestions to sinareza@gmail.com"
    
    let headlineAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 24)]
    
    let titleAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 18)]
    
    let bodyAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createText()
        
    }
    
    private func createText() {
        
        let headlineLabel = UILabel()
        headlineLabel.textAlignment = .center
        headlineLabel.attributedText = NSAttributedString(string: headline, attributes: headlineAttributes)

        let rulesTitleLabel = UILabel()
        rulesTitleLabel.attributedText = NSAttributedString(string: rulesTitle, attributes: titleAttributes)

        let rulesLabel = UILabel()
        rulesLabel.attributedText = NSAttributedString(string: rules, attributes: bodyAttributes)
        rulesLabel.numberOfLines = 0
        rulesLabel.lineBreakMode = .byWordWrapping

        let howTitleLabel = UILabel()
        howTitleLabel.attributedText = NSAttributedString(string: howTitle, attributes: titleAttributes)
        
        let howLabel = UILabel()
        howLabel.attributedText = NSAttributedString(string: howText, attributes: bodyAttributes)
        howLabel.numberOfLines = 0
        howLabel.lineBreakMode = .byWordWrapping

        
        let endingLabel = UILabel()
        endingLabel.attributedText = NSAttributedString(string: endingText, attributes: bodyAttributes)
        endingLabel.numberOfLines = 0
        endingLabel.lineBreakMode = .byWordWrapping

        let textWrapper = UIStackView(arrangedSubviews: [headlineLabel, rulesTitleLabel, rulesLabel, howTitleLabel, howLabel, endingLabel])
        view.addSubview(textWrapper)
        textWrapper.axis = .vertical
        textWrapper.alignment = .fill
        textWrapper.distribution = .fill
        textWrapper.translatesAutoresizingMaskIntoConstraints = false
        textWrapper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textWrapper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        textWrapper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true

    }
}
