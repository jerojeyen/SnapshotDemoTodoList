//
//  TodoNewItem.swift
//  SnapshotDemoTodoList (iOS)
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import SwiftUI

struct TodoNewItem: View {
  @EnvironmentObject var itemStore: ItemStore
  @State var newItemTitle: String = ""
  
  var body: some View {
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
}

struct TodoNewItem_Previews: PreviewProvider {
  static var previews: some View {
    TodoNewItem(newItemTitle: "")
        .environmentObject(ItemStore())
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
    TodoNewItem(newItemTitle: "Write Tests")
        .environmentObject(ItemStore())
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
  }
}
