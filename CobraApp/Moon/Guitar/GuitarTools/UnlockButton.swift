//
//  ButtonKids.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class UnlockButton: UIView {
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Unlock"
        label.textColor = .white
        label.font = R.Fonts.Italic(with: 18)
        return label
    }()
    
    private let buttonImage: UIImageView = {
        let image = UIImageView()
        image.image = R.Images.lock
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let buttonBody: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.orange
        view.layer.cornerRadius = 21
        
        return view
    }()
    
    private let tapButton: UIButton = {
        let view = UIButton()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack.addArrangedSubview(buttonImage)
        stack.addArrangedSubview(buttonLabel)
        
        
        addSubview(buttonBody)
        addSubview(tapButton)
        addSubview(stack)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        buttonBody.translatesAutoresizingMaskIntoConstraints = false
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBody.heightAnchor.constraint(equalToConstant: 40),
            buttonBody.widthAnchor.constraint(equalToConstant: 160),
            
            tapButton.heightAnchor.constraint(equalToConstant: 40),
            tapButton.widthAnchor.constraint(equalToConstant: 160),
            
            stack.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: buttonBody.centerXAnchor),

        
        ])
    }
}
