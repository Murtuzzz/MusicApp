//
//  ContentView.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 06.06.2023.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let contentViewController: UIViewController
    
    lazy var contentNavigationController: UINavigationController = {
            return UINavigationController(rootViewController: contentViewController)
        }()
    
    init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        addChild(contentNavigationController)
        view.addSubview(contentNavigationController.view)
        
        configureContentViewController()
        setBackgroundImage()
        //navigationItem.leftBarButtonItem = 
        
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImage(named: "back") // Замените "YourImageName" на имя вашего изображения
        let backgroundImageView = UIImageView(frame: self.view.bounds) // Создайте UIImageView
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill // Определите, как ваше изображение должно быть отображено на фоне (например, с анаморфным масштабированием)
        
        backgroundImageView.clipsToBounds = true
        // Если требуется обновлять позицию фонового изображения при изменении размера ViewController (например, при изменении ориентации), добавьте эту строку:
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(backgroundImageView, at: 0) // Добавьте backgroundImageView в качестве подпредставления перед всеми другими представлениями
    }
    
    func configureContentViewController() {
        let screenWidth = UIScreen.main.bounds.width
        let containerHeight: CGFloat = 300 // Высота DetailsView относительно вашего размера
        
        contentViewController.view.frame = CGRect(x: 0, y: view.frame.height - containerHeight,
                                                  width: screenWidth,
                                                  height: containerHeight)
        
        // Если вы хотите округлить углы сверху, добавьте следующие две строки
        contentViewController.view.layer.cornerRadius = 20
        contentViewController.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

