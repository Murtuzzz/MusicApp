//
//  Collection.swift
//  Test
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

class CardsView: UICollectionViewCell {
    
    static let identifier = "CustomCollectionCellView"
    
    
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "play")!
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 20
        
        button.backgroundColor = .black.withAlphaComponent(0.4)

        return button
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        //imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = R.Fonts.Italic(with: 16)
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = .white
        label.textAlignment = .left
        label.font = R.Fonts.Italic(with: 22)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(button)
        
        contentView.backgroundColor = R.Colors.background
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    public func configure(label: String, image: UIImage, description: String) {
        mainLabel.text = label
        myImageView.image = image
        descriptionLabel.text = description
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.frame = CGRect(x: 130, y: (contentView.frame.size.height - 200) / 6, width: 35, height: 35)
      
        mainLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 70 , width: 120, height: 30)
        
        descriptionLabel.frame = CGRect(x: 0, y: contentView.frame.size.height-55 , width: 150, height: 50)
        
        myImageView.frame = CGRect(x: 5, y: -30 , width: contentView.frame.size.width-10, height: contentView.frame.size.height-10)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
