//
//  HomeView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    init() {
        let email = UserDefaults.standard.string(forKey: "loggedInUserEmail") ?? ""

        _tasks = FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.title, ascending: true)],
            predicate: NSPredicate(format: "userEmail == %@", email),
            animation: .default
        )
    }
    @AppStorage("isLoggedIn") private var isLoggedIn = true
    @Environment(\.managedObjectContext) private var context
    @State private var showAddTask = false
    @State private var showLogout = false
    @State private var selectedTask: TaskEntity?
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    @FetchRequest var tasks: FetchedResults<TaskEntity>

    var body: some View {
        NavigationStack {
            List {
                if tasks.isEmpty {
                    Text("No tasks available,create one to remember")
                        .foregroundColor(.secondary)
                }
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title!)
                            .font(.title2)
                            .onTapGesture {
                                selectedTask = task
                                showAddTask = true
                            }
                        Spacer()
                        if let deadline = task.deadline {
                            Text(dateFormatter.string(from: deadline))
                        }
                     
                       
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(.plain)
            .navigationTitle("TO DO LIST")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            selectedTask = nil
                            showAddTask = true
                        } label: {
                            Label("Add Task", systemImage: "plus")
                        }

                        Divider()

                        Button(role: .destructive) {
                            showLogout = true
                        } label: {
                            Label("Logout", systemImage: "power")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddNewTask(taskToEdit: selectedTask)
                    .presentationDragIndicator(.visible)
            }
            .alert(isPresented: $showLogout) {
                ShowLogoutAlert.logoutAlert(isLoggedIn: $isLoggedIn)
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach(context.delete)
        saveContext()
    }

    private func saveContext() {
        try? context.save()
    }
}

#Preview {
    HomeView()
}
