//
//  TodoItemTest.swift
//  SnapshotDemoTodoListTests
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotDemoTodoList

class TodoItemTest: XCTestCase {
  func testSimpleTodoItem() {
    let view = TodoItem(item: Item(title: "Write Snapshot tests"))
    let vc = UIHostingController(rootView: view)
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testLongTodoItem() {
    let view = TodoItem(item:Item(title: "Write some Snapshot tests for the Albelli QA Meetup and drink coffee"))
    let vc = UIHostingController(rootView: view)
    
    assertSnapshot(matching: vc, as: .image)
    assertSnapshot(matching: vc, as: .image(size: .init(width: 300, height: 200)))
    assertSnapshot(matching: vc, as: .image(size: .init(width: 250, height: 200)))
  }
  
  func testCompletedTodoItem() {
    let view = TodoItem(item: Item(title: "Write Snapshot tests", isCompleted: true))
    let vc = UIHostingController(rootView: view)
    assertSnapshot(matching: vc, as: .image)
  }
}
