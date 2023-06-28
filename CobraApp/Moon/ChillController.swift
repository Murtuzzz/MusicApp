//
//  ChillController.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 06.06.2023.
//

import UIKit


final class ChillController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        title = "Details"
        // Отобразить текст и описание переданных данных
        let label = UILabel()
        label.text = "Hello"
        let descriptionLabel = UILabel()
        descriptionLabel.text = "descript"
        view.addSubview(label)
        view.addSubview(descriptionLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])
    }
}
