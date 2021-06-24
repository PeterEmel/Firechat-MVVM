//
//  ProfileHeader.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/23/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

protocol ProfileHeaderDelegate: class {
    func dismissController()
}

class ProfileHeader: UIView {
    
    // MARK: Properties
    var user: User? {
        didSet { populateUserData() }
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.tintColor = UIColor.white
        button.imageView?.setDimensions(height: 22, width: 22)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4.0
        return iv
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "fullname"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "username"

        return label
    }()
    
    // MARK: LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureGradientLayer()
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    @objc func handleDismissal() {
        delegate?.dismissController()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        profileImageView.setDimensions(height: 200, width: 200)
        profileImageView.layer.cornerRadius = 200/2
        
        addSubview(profileImageView)
        profileImageView.centerX(inView: self)
        profileImageView.anchor(top: topAnchor, paddingTop: 96)
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: profileImageView.bottomAnchor, paddingTop:16)
        
        addSubview(dismissButton)
        dismissButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12)
        dismissButton.setDimensions(height: 48, width: 48)
    }
  
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 191/255, green: 90/255, blue: 242/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1).cgColor]
        gradient.locations = [0,1]
        layer.addSublayer(gradient)
        gradient.frame = bounds
    }
    
    func populateUserData() {
        guard let user = user else {return}
        fullnameLabel.text = user.fullname
        usernameLabel.text = "@" + user.username
        
        let url = URL(string: user.profileImageUrl)
        profileImageView.sd_setImage(with: url)
        
    }
}
