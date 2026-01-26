//
//  ContentView.swift
//  To-Do List Hackwich
//
//  Created by stephanie rocha marquez on 1/22/26.
//

import SwiftUI

struct ContentView: View {
    @State private var toDoItems =
            [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
             ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
             ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoItems) { item in
                    Text(item.description)
                }
                .onMove(perform: { indices, newOffset in
                    toDoItems.move (fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSets in
                    toDoItems.remove(atOffsets: indexSets)
                })
            }
        }
        .navigationBarTitle("To Do List", displayMode: .inline)
        .navigationBarItems(leading: EditButton())
                            
    }
}

#Preview {
    ContentView()
}
struct ToDoItem: Identifiable {
    var id: UUID = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
