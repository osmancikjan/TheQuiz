//
//  MultipleAnswerCell.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 23.03.2024.
//

import Foundation
import UIKit

class AnswerCell: UITableViewCell {
    var isChecked = false {
        didSet {
            refreshCheckbox()
        }
    }
    var isMultipleAnswers: Bool = false {
        didSet {
            refreshCheckbox()
        }
    }
    var text = "" {
        didSet {
            label.text = text
        }
    }
    private let checkbox = UIImageView()
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        initUI()
    }
}

extension AnswerCell {
    func initUI() {
        contentView.layer.cornerRadius = 8
        backgroundColor = .clear
        contentView.backgroundColor = .white.withAlphaComponent(0.5)
        let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        contentView.frame = contentView.frame.inset(by: margins)
        
        checkbox.image = isMultipleAnswers ? UIImage(systemName: "square") : UIImage(systemName: "circle")
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.contentMode = .scaleAspectFit
        checkbox.tintColor = UIColor(named: "Black")
        
        contentView.addSubview(checkbox)
        
        checkbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        checkbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = text
        label.textAlignment = .left
        
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        label.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 16).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func refreshCheckbox() {
        if isChecked {
            checkbox.image = isMultipleAnswers ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "circle.fill")
        } else {
            checkbox.image = isMultipleAnswers ? UIImage(systemName: "square") : UIImage(systemName: "circle")
        }
    }
}
