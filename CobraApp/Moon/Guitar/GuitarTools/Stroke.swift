
import UIKit

final class Stroke: UIView {
    private let contentView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.gray.cgColor // замените R.Colors.inactive на соответствующий UIColor
        view.translatesAutoresizingMaskIntoConstraints = false // добавьте это
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false // добавьте это
        return view
    }()
    
    private let numberOfSong: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.inactive
        label.font = UIFont.systemFont(ofSize: 17) // замените R.Fonts.nonItalic на соответствующий UIFont
        label.translatesAutoresizingMaskIntoConstraints = false // добавьте это
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "lock")!
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .black.withAlphaComponent(0.4)
        button.translatesAutoresizingMaskIntoConstraints = false // добавьте это
        return button
    }()
    
    private let nameOfSong: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = R.Fonts.nonItalic(with: 20) // замените R.Fonts.nonItalic на соответствующий UIFont
        label.translatesAutoresizingMaskIntoConstraints = false // добавьте это
        return label
    }()
        
    init(name: String, number: String) {
        super.init(frame: .zero)
        
        nameOfSong.text = name
        numberOfSong.text = number

        setupViews()
        
       
    }
    
    @objc func tap() {
        print("button tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(numberOfSong)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(nameOfSong)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            //stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            numberOfSong.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            numberOfSong.topAnchor.constraint(equalTo: stackView.topAnchor),
            numberOfSong.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            button.widthAnchor.constraint(equalToConstant: 36),
            button.heightAnchor.constraint(equalToConstant: 36),
            

          
            
         
        ])
    }
}
