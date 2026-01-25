//
//  ContentView.swift
//  To-Do List Hackwich
//
//  Created by stephanie rocha marquez on 1/22/26.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First thing", "Second thing","Third thing", "Fourth thing", "Fifth thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove(perform: { indices, newOffset in
                    things.move (fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSets in
                    things.remove(atOffsets: indexSets)
                })
            }
        }
        .navigationBarTitle("Things", displayMode: .inline)
        .navigationBarItems(leading: EditButton())
                            
    }
}

#Preview {
    ContentView()
}
