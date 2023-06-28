//
//  ScrollView.swift
//  Test
//
//  Created by Мурат Кудухов on 07.06.2023.
//

struct ProfileItems {
    let title: String
    let image: UIImage
    let arrowColor: UIColor?
    let imageColor: UIColor?
    let titleColor: UIColor?
}

import UIKit

final class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let logIn = LoginView()
    
    private let navController = NavController(header: "Profile")
    
    var myTableView = UITableView()
    let id = "MyCell"
    var dataSource: [ProfileItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navController)
        view.addSubview(logIn)
        view.backgroundColor = R.Colors.background
        createTable()
    }
    
    func createTable() {
        myTableView = UITableView(frame: .zero, style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = R.Colors.background
        myTableView.register(ProfileControllerCell.self, forCellReuseIdentifier: ProfileControllerCell.id)
        myTableView.isScrollEnabled = true
        myTableView.separatorColor = R.Colors.inactive
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        dataSource = [
            .init(title: "Get Premium", image: UIImage(systemName: "crown.fill")!, arrowColor: R.Colors.orange,imageColor: R.Colors.orange, titleColor: R.Colors.orange),
            
                .init(title: "", image: UIImage(), arrowColor: R.Colors.background,imageColor: nil, titleColor: nil),
            
                .init(title: "Private policy", image: UIImage(systemName: "doc.richtext.fill")!,arrowColor: .systemGray2,imageColor: .systemGreen,titleColor: .white),
            .init(title: "License agreement", image: UIImage(systemName: "doc.on.doc.fill")!,arrowColor: .systemGray2, imageColor: .systemGreen,titleColor: .white),
            .init(title: "", image: UIImage(),arrowColor: R.Colors.background,imageColor: nil,titleColor: nil),
            .init(title: "Rate us", image: UIImage(systemName: "star.fill")!,arrowColor: .systemGray2,imageColor: .systemRed,titleColor: .white),
            .init(title: "Sent Feedback", image: UIImage(systemName: "text.bubble.fill")!,arrowColor: .systemGray2,imageColor: .systemRed,titleColor: .white)]
        
        myTableView.reloadData()
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(myTableView)
        
        navController.translatesAutoresizingMaskIntoConstraints = false
        logIn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            logIn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logIn.bottomAnchor.constraint(equalTo: myTableView.topAnchor),
           
            
            navController.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            navController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            navController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 336)
        
        
        ])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileControllerCell.id, for: indexPath) as? ProfileControllerCell else {
            fatalError("error")}
        
        let items = dataSource[indexPath.row]
        
        cell.configure(image: items.image, text: items.title, arrowColor: items.arrowColor, labelColor: items.titleColor, imageColor: items.imageColor)
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let bgColorView = UIView()
        bgColorView.backgroundColor = R.Colors.bar // цвет выделения
        cell.selectedBackgroundView = bgColorView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    

    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
}
