////
////  ViewController.swift
////  CobraApp
////
////  Created by Мурат Кудухов on 03.06.2023.
////
//
//import UIKit
//
//class MusicController: UIViewController {
//
//    let childCollection = ChildCollection()
//    let natureCollection = NatureCollection()
//    let animalCollection = AnimalsCollection()
//
//    private let childHeader = MusicHeaders(header: "Child", desc: "Quickly stabilize your baby’s emotions")
//    private let natureHeader = MusicHeaders(header: "Nature", desc: "It will allow you to merge with nature")
//    private let animalHeader = MusicHeaders(header: "Animals", desc: "Animal voices will improve your sleep")
//
//    private let navController = NavController(header: "Composer")
//
//    private var collectionView: UICollectionView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addViews()
//        view.backgroundColor = R.Colors.background
//        constraints()
//
//    }
//
//    func addViews() {
//        view.addSubview(navController)
//        view.addSubview(childCollection)
//        view.addSubview(childHeader)
//        view.addSubview(natureCollection)
//        view.addSubview(natureHeader)
//        view.addSubview(animalCollection)
//        view.addSubview(animalHeader)
//    }
//
//    func constraints() {
//        childCollection.translatesAutoresizingMaskIntoConstraints = false
//        natureCollection.translatesAutoresizingMaskIntoConstraints = false
//        animalCollection.translatesAutoresizingMaskIntoConstraints = false
//        navController.translatesAutoresizingMaskIntoConstraints = false
//        childHeader.translatesAutoresizingMaskIntoConstraints = false
//        natureHeader.translatesAutoresizingMaskIntoConstraints = false
//        animalHeader.translatesAutoresizingMaskIntoConstraints = false
//
//
//        NSLayoutConstraint.activate([
//
//            childHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
//            childHeader.heightAnchor.constraint(equalToConstant: 60),
//            childHeader.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            childCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            childCollection.heightAnchor.constraint(equalToConstant: 200),
//            childCollection.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            natureHeader.topAnchor.constraint(equalTo: childCollection.bottomAnchor, constant: 10),
//            natureHeader.heightAnchor.constraint(equalToConstant: 60),
//            natureHeader.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            natureCollection.topAnchor.constraint(equalTo: childCollection.bottomAnchor, constant: 30),
//            natureCollection.heightAnchor.constraint(equalToConstant: 200),
//            natureCollection.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            animalHeader.topAnchor.constraint(equalTo: natureCollection.bottomAnchor, constant: 10),
//            animalHeader.heightAnchor.constraint(equalToConstant: 60),
//            animalHeader.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//            animalCollection.topAnchor.constraint(equalTo: natureCollection.bottomAnchor, constant: 30),
//            animalCollection.heightAnchor.constraint(equalToConstant: 200),
//            animalCollection.widthAnchor.constraint(equalToConstant: view.frame.width),
//
//
//            navController.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
//            navController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            navController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//
//
//        ])
//    }
//
//}
