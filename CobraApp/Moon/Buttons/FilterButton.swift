//
//  buttonAll.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit


final class FilterButton: UIView {
    private var isSelected = false
    
    
    var onTap: (() -> ())?
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = R.Fonts.Italic(with: 18)
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let buttonBody: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.active
        //view.layer.borderWidth = 1
        view.layer.cornerRadius = 21
        
        return view
    }()
    
    private let tapButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    
    init(title: String, image: UIImage, initialSelection: Bool = false) {
        self.isSelected = initialSelection
        super.init(frame: .zero)
        
        addSubview(buttonBody)
        addSubview(imageView)
        addSubview(label)
        addSubview(tapButton)
        
        label.text = title
        imageView.image = image
        tapButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        updateState()
        
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setSelected(_ selected: Bool) {
        isSelected = selected
        updateState()
    }
    
    
    private func constraints() {
        buttonBody.translatesAutoresizingMaskIntoConstraints = false
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            buttonBody.topAnchor.constraint(equalTo: topAnchor),
            buttonBody.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonBody.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonBody.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tapButton.topAnchor.constraint(equalTo: topAnchor),
            tapButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            tapButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            tapButton.trailingAnchor.constraint(equalTo: trailingAnchor)

        ])
    }
    
    
    private func updateState() {
        buttonBody.backgroundColor = isSelected ? R.Colors.active : R.Colors.bar
    }
    
    
    @objc
    private func buttonTapped() {
        isSelected = true
        updateState()
        onTap?()
    }
}
