//
//  MoonNavController.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class NavController: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.Italic(with: 34)
        label.textColor = .white
        return label
    }()
    
    init(header: String) {
        super.init(frame: .zero)
        label.text = header
        settings()
        addSubview(label)
        constraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        
        ])
    }
    
    func settings() {
    }

}

