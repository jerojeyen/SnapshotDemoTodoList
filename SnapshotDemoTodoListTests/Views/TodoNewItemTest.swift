//
//  TodoNewItemTest.swift
//  SnapshotDemoTodoListTests
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotDemoTodoList

class TodoNewItemTest: XCTestCase {

  func testEmptyTodoNewItem() {
      let view = TodoNewItem(newItemTitle: "")
      let vc = UIHostingController(rootView: view)
    
      assertSnapshot(matching: vc, as: .image)
  }
  
  func testFillingTodoNewItem() {
      let view = TodoNewItem(newItemTitle: "Write Tests")
      let vc = UIHostingController(rootView: view)
    
      assertSnapshot(matching: vc, as: .image)
  }

}
