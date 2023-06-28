//
//  MoonButtonsView.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class MoonButtonsView: UIView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        return view
        
    }()
    
    private let buttonAll = FilterButton(title: "All", image: R.Images.allButton!, initialSelection: true)
    private let buttonAmbient = FilterButton(title: "Ambient", image: R.Images.ambient!)
    private let buttonKids = FilterButton(title: "For kids", image: R.Images.kids!)
    
    
    var onFilterChange: ((ItemFilter) -> ())?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(buttonAll)
        stackView.addArrangedSubview(buttonAmbient)
        stackView.addArrangedSubview(buttonKids)
        
        addSubview(stackView)
        settings()
        constraints()
        
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func settings() {
        buttonAll.onTap = {
            self.buttonAmbient.setSelected(false)
            self.buttonKids.setSelected(false)
            self.onFilterChange?(.all)
        }
        buttonAmbient.onTap = {
            self.buttonAll.setSelected(false)
            self.buttonKids.setSelected(false)
            self.onFilterChange?(.ambient)
        }
        buttonKids.onTap = {
            self.buttonAmbient.setSelected(false)
            self.buttonAll.setSelected(false)
            self.onFilterChange?(.forKids)
        }
    }
}
