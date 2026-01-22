//
//  HomeView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI



struct HomeView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = true

    @State private var showAddTask: Bool = false
    @State private var showLogout: Bool = false
    @State private var cameFrom : String = ""
    @State var tasks : [Tasks] = []
    @State private var selectedTask: Tasks? = nil
    var body: some View {
        NavigationStack {
            List{
                ForEach(tasks){ task in
                    Text(task.title)
                        .font(.title2)
                        .onTapGesture {
                            selectedTask = task
                            cameFrom = "EditView"
                            showAddTask = true
                        }
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(.plain)
            .navigationTitle("TO DO LIST ")
            .toolbar {
                
//                //  EDIT BUTTON (Leading)
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        showAddTask = true
//                        cameFrom = "EditView"
//                    } label: {
//                        Text("Edit")
//                            .padding()
//                          
//                    }
//
//
//                }
//                
                //  ADD + LOGOUT (Trailing Menu)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            selectedTask = nil
                            showAddTask = true
                            cameFrom = "HomeView"
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
            .sheet(isPresented : $showAddTask) {
                AddNewTask(fromWhichScreen: $cameFrom, task: $tasks,selectedTask : $selectedTask)
                    .presentationDragIndicator(.visible)
            }
            .alert(isPresented: $showLogout) {
                ShowLogoutAlert.logoutAlert(isLoggedIn: $isLoggedIn)
            }
            .onAppear{
                 tasks = TaskManager.load() ?? []
            }
            .onChange(of: tasks) {newValue in
                TaskManager.saveTasks(newValue)
            }
        }
    }
    private func deleteTask(at offSets : IndexSet){
         tasks.remove(atOffsets: offSets)
    }
}
#Preview {
    HomeView()
}
