//
//  ToDoList.swift
//  To-Do List Hackwich
//
//  Created by stephanie rocha marquez on 1/28/26.
//

import Foundation
@Observable
class ToDoList {
    var items = [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
                 ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                 ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
 }
 
