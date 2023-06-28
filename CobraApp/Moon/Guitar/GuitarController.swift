//
//  GuitarController.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 06.06.2023.
//

import UIKit

struct GuitarItems {
    let image: UIImage
    let text: String
    let descript: String
    
}

final class GuitarController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView?
    
    let featuredLabel: UILabel = {
        let label = UILabel()
        label.text = "Featured On"
        label.textColor = .white
        label.font = R.Fonts.Italic(with: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imagePicture: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.Colors.background
        view.layer.cornerRadius = 25
        return view
    }()
    
    let topViewRounded: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.Colors.bar
        view.layer.cornerRadius = 3
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.Colors.background
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    let songs: UILabel = {
        let label = UILabel()
        label.text = "LIST OF SONGS"
        label.textColor = R.Colors.inactive
        label.font = R.Fonts.nonItalic(with: 14)
        return label
    }()
    
    let songsList: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.bar
        view.layer.cornerRadius = 15
        return view
    }()
    
    let firstSong = Stroke(name: "The Guitars", number: "01")
    let secondSong = Stroke(name: "Lost Without You", number: "02")
    let thirdSong = Stroke(name: "City Lights", number: "03")
    let fouthSong = Stroke(name: "Romantic", number: "04")
    
    private let mainText: UILabel = {
        let label = UILabel()
        label.text = "An acoustic mix has been specially selected for you. The camping atmosphere will help you improve your sleep and your body as a whole. Your dreams will be delightful and vivid."
        label.numberOfLines = 5
        label.font = R.Fonts.Italic(with: 20)
        label.textAlignment = .natural
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let textHeader: UILabel = {
        let label = UILabel()
        label.text = "About this pack"
        label.font = R.Fonts.Italic(with: 22)
        label.textColor = .white
        return label
    }()
    
    private let buttonUnlock = UnlockButton()
    private let buttonFavorite = FavoriteButton()
    
    private let separator1: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.bar
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separator2: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.bar
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separator3: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.sep
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separator4: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.sep
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separator5: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.sep
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Guitar Camp"
        label.font = R.Fonts.Italic(with: 36)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "7 songs • instrumental"
        label.font = R.Fonts.nonItalic(with: 17)
        return label
    }()
    
    var dataSource: [GuitarItems] = []
 //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.background
        addNavBarButton(at: .left, with: "Sleep")
        addViews()
        collectionViewApperance()
        
        constraints()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
    
    func collectionViewApperance() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        
        dataSource = [.init(image: UIImage(named: "cover3")!, text: "Sleep-Mix", descript: "7 songs • instrumental"),
                      .init(image: UIImage(named: "cover4")!, text: "Night-Mix", descript: "7 songs • instrumental"),
                      .init(image: UIImage(named: "cover5")!, text: "Chill-Mix", descript: "7 songs • instrumental"),
                      .init(image: UIImage(named: "cover")!, text: "Sheke-Mix", descript: "7 songs • instrumental"),
                      .init(image: UIImage(named: "cover2")!, text: "Beke-Mix", descript: "7 songs • instrumental")]
        
        collectionView?.reloadData()
        
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(GuitarCollection.self, forCellWithReuseIdentifier: GuitarCollection.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        
        middleView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   collectionView.topAnchor.constraint(equalTo: songsList.bottomAnchor, constant: 15),
                   collectionView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 10),
                   collectionView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -10),
                   collectionView.bottomAnchor.constraint(equalTo: middleView.bottomAnchor)
               ])
        
        
        
    }
    
    func addViews() {
        view.addSubview(imagePicture)
        view.addSubview(scrollView)
        
        
        topView.addSubview(label)
        topView.addSubview(descriptionLabel)
        
        middleView.addSubview(separator1)
        middleView.addSubview(separator2)
        middleView.addSubview(buttonUnlock)
        middleView.addSubview(buttonFavorite)
        middleView.addSubview(textHeader)
        middleView.addSubview(mainText)
        
        stackView.addArrangedSubview(firstSong)
        stackView.addArrangedSubview(secondSong)
        stackView.addArrangedSubview(thirdSong)
        stackView.addArrangedSubview(fouthSong)
        
        middleView.addSubview(songsList)
        middleView.addSubview(stackView)
        
        middleView.addSubview(separator3)
        middleView.addSubview(separator4)
        middleView.addSubview(separator5)
        middleView.addSubview(featuredLabel)
        
        //contentView.addSubview(imagePicture)
        topView.addSubview(topViewRounded)
//        contentView.addSubview(imagePicture)
        
        contentView.addSubview(topView)
        
        contentView.addSubview(middleView)
        scrollView.addSubview(contentView)
        //view.addSubview(songsList)
//        view.addSubview(firstSong)
//        view.addSubview(secondSong)
//        view.addSubview(thirdSong)
//        view.addSubview(fouthSong)
        view.addSubview(songs)
        scrollView.backgroundColor = .clear
    }
    //MARK: - Constraints
    func constraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textHeader.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false
        buttonUnlock.translatesAutoresizingMaskIntoConstraints = false
        buttonFavorite.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstSong.translatesAutoresizingMaskIntoConstraints = false
        secondSong.translatesAutoresizingMaskIntoConstraints = false
        thirdSong.translatesAutoresizingMaskIntoConstraints = false
        fouthSong.translatesAutoresizingMaskIntoConstraints = false
        songsList.translatesAutoresizingMaskIntoConstraints = false
        songs.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            featuredLabel.topAnchor.constraint(equalTo: songsList.bottomAnchor, constant: 20),
            featuredLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor), // Устанавливает ширину
            contentView.heightAnchor.constraint(equalToConstant: 1550),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 500),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            topView.heightAnchor.constraint(equalToConstant: 150),
            
            topViewRounded.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15),
            topViewRounded.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 170),
            topViewRounded.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -170),
            topViewRounded.heightAnchor.constraint(equalToConstant: 5),
            
            imagePicture.topAnchor.constraint(equalTo: view.topAnchor),
            imagePicture.leftAnchor.constraint(equalTo: view.leftAnchor),
            imagePicture.rightAnchor.constraint(equalTo: view.rightAnchor),
            imagePicture.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -50),
            middleView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            middleView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            middleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //MARK: - mainConstraints
            songs.leadingAnchor.constraint(equalTo: songsList.leadingAnchor, constant: 15),
            songs.topAnchor.constraint(equalTo: songsList.topAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: songsList.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: songs.topAnchor, constant: 25),
            
            separator3.leadingAnchor.constraint(equalTo: songsList.leadingAnchor, constant: 20),
            separator3.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            separator3.topAnchor.constraint(equalTo: songs.bottomAnchor, constant: 65),
            separator3.heightAnchor.constraint(equalToConstant: 1),
            
            separator4.leadingAnchor.constraint(equalTo: songsList.leadingAnchor, constant: 20),
            separator4.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            separator4.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: 65),
            separator4.heightAnchor.constraint(equalToConstant: 1),
            
            separator5.leadingAnchor.constraint(equalTo: songsList.leadingAnchor, constant: 20),
            separator5.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            separator5.topAnchor.constraint(equalTo: separator4.bottomAnchor, constant: 65),
            separator5.heightAnchor.constraint(equalToConstant: 1),
            
            songsList.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            songsList.topAnchor.constraint(equalTo: mainText.bottomAnchor, constant: 10),
            songsList.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            songsList.heightAnchor.constraint(equalToConstant: 300),
            
            textHeader.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            textHeader.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 30),
            textHeader.widthAnchor.constraint(equalToConstant: 170),
            textHeader.heightAnchor.constraint(equalToConstant: 20),
            
            mainText.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            mainText.topAnchor.constraint(equalTo: textHeader.bottomAnchor, constant: 5),
            mainText.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            mainText.heightAnchor.constraint(equalToConstant: 120),
            
            buttonUnlock.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            buttonUnlock.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 30),
            buttonUnlock.widthAnchor.constraint(equalToConstant: 170),
            buttonUnlock.heightAnchor.constraint(equalToConstant: 40),
            
            
            buttonFavorite.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            buttonFavorite.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 30),
            buttonFavorite.heightAnchor.constraint(equalToConstant: 40),
            buttonFavorite.widthAnchor.constraint(equalToConstant: 170),
            
            separator1.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            separator1.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            separator1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 55),
            separator1.heightAnchor.constraint(equalToConstant: 1),
            
            separator2.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20),
            separator2.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20),
            separator2.topAnchor.constraint(equalTo: buttonFavorite.bottomAnchor, constant: 30),
            separator2.heightAnchor.constraint(equalToConstant: 1),

            
            label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 22),
            
        
        ])
    }
    @objc override func navBarLeftButtonHandler() {
        //navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GuitarCollection.identifier, for: indexPath) as! GuitarCollection
        
        let item = dataSource[indexPath.row]
        
        cell.configure(label: item.text, image: item.image, description: item.descript)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10) / 2 // Ширина ячейки равна половине доступной ширины минус 10, чтобы оставить отступ между ячейками
        let height: CGFloat = 250 // Высота ячейки равна 100
        
        return CGSize(width: width, height: height)
    }
}

