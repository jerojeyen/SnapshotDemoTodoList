//
//  ItemStore.swift
//  SnapshotDemoTodoList (iOS)
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var items: [Item]
    
    init() {
        items = []
    }
    
    func add(_ title: String) {
        let item = Item(title: title)
        items.append(item)
    }
    
    func toggleComplete(_ item: Item) {
        index(of: item).map { items[$0].isCompleted.toggle() }
    }
    
    func index(of item: Item) -> Int? {
        return items.firstIndex(of: item)
    }
    
    func clean() {
        items.removeAll()
    }
}
