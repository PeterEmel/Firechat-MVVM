//
//  LoginController.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/9/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class LoginController : UIViewController {
    
    // MARK: - Properties
    private let iconImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "whiteMessage2")
        iv.tintColor = UIColor.white
        return iv
    }()
    
    private let emailContainerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = UIColor.cyan
        containerView.setHeight(height: 50)
        
        let iv = UIImageView()
        iv.image = UIImage(named: "envelope")
        iv.tintColor = UIColor.white
        
        containerView.addSubview(iv)
        iv.centerY(inView: containerView)
        iv.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        return containerView
    }()
    
    private let passwordContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.yellow
        containerView.setHeight(height: 50)

        return containerView
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.red
        button.setHeight(height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 140)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 191/255, green: 90/255, blue: 242/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1).cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
