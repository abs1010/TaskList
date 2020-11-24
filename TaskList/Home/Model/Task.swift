//
//  Task.swift
//  TaskList
//
//  Created by Alan Silva on 23/11/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

enum priority: CaseIterable {
    case low
    case medium
    case heigh
}

struct Task {
    let name: String
    let priority: priority
}
