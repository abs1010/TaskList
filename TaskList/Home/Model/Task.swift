//
//  Task.swift
//  TaskList
//
//  Created by Alan Silva on 23/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

enum Priority: Int, CaseIterable {
    case all = 0
    case heigh = 1
    case medium = 2
    case low = 3
}

struct Task {
    let name: String
    let priority: Priority
}
