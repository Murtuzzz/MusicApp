//
//  ProfileController.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 03.06.2023.

import UIKit

final class ProfileControllerCell: UITableViewCell {
    
    static let id = "TableViewCell"
    
    private let mainIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "questionmark")
        image.tintColor = .label
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

       private let title: UILabel = {
           let lable = UILabel()
           lable.textColor = .white
           lable.translatesAutoresizingMaskIntoConstraints = false
           lable.textAlignment = .left
           lable.text = "Error"
           return lable
       }()
    
    private let arrow: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        constraints()
        backgroundColor = R.Colors.background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.contentView.addSubview(mainIcon)
        self.contentView.addSubview(title)
        self.contentView.addSubview(arrow)
        
    }
    
    func configure(image: UIImage? = nil, text: String, arrowColor: UIColor? = nil, labelColor: UIColor?, imageColor: UIColor? = nil) {
        
        title.textColor = labelColor
        mainIcon.tintColor = imageColor
        arrow.tintColor = arrowColor
        mainIcon.image = image
        title.text = text
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            
            arrow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            arrow.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            arrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
            mainIcon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            mainIcon.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            mainIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: mainIcon.trailingAnchor, constant: 20),

//            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
//            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
        
        ])
    }
}
