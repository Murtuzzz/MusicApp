//
//  TestCollection.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 12.06.2023.
//

import UIKit

struct TestItems {
    struct Info {
        let content: UIView
    }
    let title: String
    let subtitle: String
    let items: [Info]
}

final class TestCollection: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let childCollection = ChildCollection()
    let natureCollection = NatureCollection()
    let animalCollection = AnimalsCollection()
    
    private let navController = NavController(header: "Composer")
    
    private var dataSource: [TestItems] = []
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionApperance()
        
        view.addSubview(navController)
        constraints()
    }
    
    func collectionApperance() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        dataSource = [.init(title: "Child", subtitle: "ShekereBerekere",
                            items:[.init(content: childCollection),]),
                      .init(title: "Child", subtitle: "ShekereBerekere", items:[.init(content: natureCollection),]),
                      .init(title: "Child", subtitle: "ShekereBerekere", items:[.init(content: animalCollection),])]
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {return}
        
        collectionView.register(TestCell.self, forCellWithReuseIdentifier: TestCell.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .gray
        
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
    }
    
    func constraints() {
        
        navController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navController.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            navController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            navController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    
    
}

extension TestCollection {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCell.id, for: indexPath) as! TestCell
        
        let items = dataSource[indexPath.section].items[0]
        
        cell.configure(content: items.content)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 126, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath
        ) as? SectionHeaderView else { return UICollectionReusableView() }
        
        let items = dataSource[indexPath.section]
        
        view.configure(header: items.title, desc: items.subtitle)
        
        return view
    }
}
