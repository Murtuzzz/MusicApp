//
//  ButtonKids.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class ButtonKids: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "For Kids"
        label.textColor = .white
        label.font = R.Fonts.Italic(with: 18)
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = R.Images.kids
        
        
        return image
    }()
    
    private let buttonBody: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.bar
        //view.layer.borderWidth = 1
        view.layer.cornerRadius = 21
        
        return view
    }()
    
    private let tapButton: UIButton = {
        let view = UIButton()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(buttonBody)
        addSubview(tapButton)
        addSubview(image)
        addSubview(label)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        buttonBody.translatesAutoresizingMaskIntoConstraints = false
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBody.heightAnchor.constraint(equalToConstant: 40),
            buttonBody.widthAnchor.constraint(equalToConstant: 120),
            
            tapButton.heightAnchor.constraint(equalToConstant: 38),
            tapButton.widthAnchor.constraint(equalToConstant: 66),
            
            image.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: buttonBody.leadingAnchor, constant: 15),
            
            //label.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: buttonBody.topAnchor, constant: 9)

        
        ])
    }
}
