//
//  Ext.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 03.06.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        
        addSubview(separator)
    }
    
    func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func roundTopCorners(view: UIView, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
    }
}

extension UIViewController {
    
func addNavBarButton(at position: NavBarPosition, with title: String) {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.setTitleColor(R.Colors.active, for: .normal)
    button.setTitleColor(R.Colors.inactive, for: .disabled)
    button.titleLabel?.font = R.Fonts.Italic(with: 20)

    switch position {
    case .left:
        button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    case .right:
        button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
}

    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }

    @objc func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }
    @objc func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}
