//
//  ContentView.swift
//  To-Do List Hackwich
//
//  Created by stephanie rocha marquez on 1/22/26.
//

import SwiftUI

struct ContentView: View {
   @State private var toDoList = ToDoList()
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList.items) { item in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.priority).font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoList.items.move (fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSets in
                    toDoList.items.remove(atOffsets: indexSets)
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

