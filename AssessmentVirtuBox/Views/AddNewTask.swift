//
//  AddNewTask.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI
import CoreData

struct AddNewTask: View {

    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) private var dismiss

    var taskToEdit: TaskEntity?
    @State private var taskName: String = ""
    @State private var showError = false

    var body: some View {
        VStack(spacing: 20) {
            Text(taskToEdit == nil ? "Add New Task" : "Edit Task")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)

            TextField("Enter task", text: $taskName)
                .textFieldStyle()

            Button(taskToEdit == nil ? "Save Task" : "Update Task") {
                saveTask()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(12)
            .font(.headline)
            
            .btnTOuchEffect()
            Spacer()
        }
        .padding()
        .alert("Please enter task", isPresented: $showError) {}
        .onAppear {
            if let task = taskToEdit {
                taskName = task.title!
            }
        }
    }

    private func saveTask() {
        guard !taskName.isEmpty else {
            showError = true
            return
        }

        if let task = taskToEdit {
            task.title = taskName
        } else {
            let newTask = TaskEntity(context: context)
            newTask.id = UUID()
            newTask.title = taskName
        }

        try? context.save()
        dismiss()
    }
}



#Preview {
    let task = [Tasks]()
    AddNewTask()
}
