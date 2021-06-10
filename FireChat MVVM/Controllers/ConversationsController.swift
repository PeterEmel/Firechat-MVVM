//
//  ConversationsController.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/8/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import UIKit

class ConversationsController : UIViewController {
    
    // Mark: - Properties
    private let tableView = UITableView()
    private let reuseIdentifier = "ConversationCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // Mark: - Selectors
    @objc func showProfile() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        
        let image = UIImage(named: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
    }
    
    func configureTableView() {
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.purple
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationItem.title = "Messages"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
    }
    
}

extension ConversationsController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "Test Cell"
        return cell
    }
    
}
extension ConversationsController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
