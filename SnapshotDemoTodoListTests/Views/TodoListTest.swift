//
//  TodoListTest.swift
//  SnapshotDemoTodoListTests
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotDemoTodoList


class TodoListTest: XCTestCase {
  
  func testEmptyTodoList() {
    let store = ItemStore()
    let view = TodoList().environmentObject(store)
    let vc = UIHostingController(rootView: view)
    
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testTodoListWithOneItem() {
    let store = ItemStore()
    store.add("Write Snapshot tests")
    let view = TodoList().environmentObject(store)
    let vc = UIHostingController(rootView: view)
    
    assertSnapshot(matching: vc, as: .image)
  }
  
  func testTodoListWithALongItem() {
    let store = ItemStore()
    store.add("Write some Snapshot tests for the Albelli QA Meetup and drink coffee")
    let view = TodoList().environmentObject(store)
    let vc = UIHostingController(rootView: view)
    
    assertSnapshot(matching: vc, as: .image)
  }
}
