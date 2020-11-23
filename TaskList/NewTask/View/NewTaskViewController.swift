//
//  ViewController.swift
//  TaskList
//
//  Created by Alan Silva on 23/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let items = ["High", "Medium", "Low"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.borderWidth = 0.5
        segmentedControl.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let titleTextAttributesForSelected = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        segmentedControl.setTitleTextAttributes(titleTextAttributesForSelected, for: .selected)
        segmentedControl.backgroundColor = .secondarySystemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUp()
        
    }
    
    private func setUp() {
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Add task"
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(addToList))
    
        view.addSubview(segmentedControl)
        //view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
    @objc private func addToList() {
        
        print("ADD TO VIEW")
        
    }
    
}
