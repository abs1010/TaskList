//
//  ViewController.swift
//  TaskList
//
//  Created by Alan Silva on 23/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import RxSwift

class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
    private let segmentedControl: UISegmentedControl = {
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
    
    private let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Type the task name"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5.0
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return textField
    }()
    
    
    private var selectedTask = PublishSubject<Task>()
    
    var setObjectObservable : Observable<Task> {
        return selectedTask.asObservable()
    }
    
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
        view.addSubview(textField)
        
        textField.becomeFirstResponder()
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        textField.delegate = self
        
    }
    
    @objc private func addToList() {
        
        let priority = Priority.allCases[segmentedControl.selectedSegmentIndex + 1]
        
        selectedTask.onNext(Task(name: textField.text!, priority: priority))
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
