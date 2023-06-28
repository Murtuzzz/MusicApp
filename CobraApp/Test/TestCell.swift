//
//  TestCell.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 12.06.2023.
//

import UIKit

final class TestCell: UICollectionViewCell {
    
    static let id = "TestCell"
    
    private var container = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(content: UIView) {
        container.addSubview(content)
    }
    
    func constraints() {
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    
    
}
