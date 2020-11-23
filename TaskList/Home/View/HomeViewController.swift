//
//  ViewController.swift
//  TaskList
//
//  Created by Alan Silva on 21/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let segmentedControl: UISegmentedControl = {
        let items = ["All", "High", "Medium", "Low"]
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
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUp() {
        
        view.backgroundColor = .secondarySystemBackground
        
        self.title = "Good List"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToTaskView))
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setUpConstraints() {
        
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
     
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        
    }
    
    @objc private func goToTaskView() {
        
        navigationController?.pushViewController(NewTaskViewController(), animated: false)
        
    }
    
    //mark: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.detailTextLabel?.text = "Texto \(indexPath.row)"
        
        return cell
    }
    

}
