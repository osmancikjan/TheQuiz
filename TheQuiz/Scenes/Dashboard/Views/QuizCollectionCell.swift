//
//  QuizCollectionCell.swift
//  TheQuiz
//
//  Created by Jan Osmančík on 22.03.2024.
//

import Foundation
import UIKit

class QuizCollectionCell: UICollectionViewCell {
    lazy var quizName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .white.withAlphaComponent(0.5)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuizCollectionCell {
    func setupUI() {
        contentView.addSubview(quizName)
        quizName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        quizName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        quizName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        quizName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
}
