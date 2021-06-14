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
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(named: "envelope"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(named: "lock"), textField: passwordTextField)
    }()
    
    private let loginButton = CustomButton(title: "Log In")
    
    private let dontHaveAccountButton : UIButton = {
        let button = AccountButton(title: "Don't have an account? ", title2: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    @objc func handleShowSignUp() {
        let controller = RegisterationController()
        navigationController?.pushViewController(controller, animated: true)
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
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)

    }
    
}
