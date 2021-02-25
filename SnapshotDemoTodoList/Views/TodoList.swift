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
          HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
              .imageScale(.large)
              .foregroundColor(item.isCompleted ? .green : .primary)
            Text(item.title)
            Spacer()
          }
          .onTapGesture {
            itemStore.toggleComplete(item)
          }
        }
        HStack {
          Image(systemName: "circle")
            .imageScale(.large)
            .foregroundColor(
              newItemTitle.isEmpty ? Color(.systemGray3) : .primary
            )
          TextField("New TODO", text: $newItemTitle, onCommit:  {
            withAnimation {
              self.itemStore.add(self.newItemTitle)
              self.newItemTitle = ""
            }
          })
        }
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
