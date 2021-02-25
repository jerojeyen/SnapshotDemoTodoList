//
//  TodoItem.swift
//  SnapshotDemoTodoList (iOS)
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import SwiftUI

struct TodoItem: View {
  @EnvironmentObject var itemStore: ItemStore
  var item: Item
  
  var body: some View {
    HStack {
      Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
        .imageScale(.large)
        .foregroundColor(item.isCompleted ? .green : .primary)
      Text(item.title)
        .lineLimit(2)
      Spacer()
    }
    .onTapGesture {
      itemStore.toggleComplete(item)
    }
  }
}

struct TodoItem_Previews: PreviewProvider {
  static var previews: some View {
    TodoItem(item: Item(title: "Test my code"))
      .previewLayout(PreviewLayout.sizeThatFits)
      .padding()
    TodoItem(item: Item(title: "Write some Snapshot tests for the Albelli QA Meetup and drink coffee"))
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
    TodoItem(item: Item(title: "Test my code", isCompleted: true))
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
  }
}
