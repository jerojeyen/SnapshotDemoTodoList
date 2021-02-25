//
//  Item.swift
//  SnapshotDemoTodoList (iOS)
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import Foundation

struct Item: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
