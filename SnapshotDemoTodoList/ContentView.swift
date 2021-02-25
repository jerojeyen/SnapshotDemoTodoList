//
//  ContentView.swift
//  Shared
//
//  Created by Jerozan Jeyendrarasa on 25/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TodoList().environmentObject(ItemStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
