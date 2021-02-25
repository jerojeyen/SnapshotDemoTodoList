//
//  TodoList.swift
//  SnapshotDemoTodoList (iOS)
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import SwiftUI

struct TodoList: View {
  @EnvironmentObject var itemStore: ItemStore
  @State var newItemTitle: String = ""
  
  var body: some View {
    NavigationView {
      List {
        ForEach(itemStore.items) { item in
          TodoItem(item: item)
        }
        TodoNewItem()
      }
      .navigationBarTitle("Todo")
      .navigationBarItems(trailing: Button("Clear", action: {
        withAnimation {
          itemStore.clean()
        }
      }))
    }
  }
}

struct TodoList_Previews: PreviewProvider {
  static var previews: some View {
    let store = ItemStore()
    TodoList()
      .environmentObject(store)
  }
}
