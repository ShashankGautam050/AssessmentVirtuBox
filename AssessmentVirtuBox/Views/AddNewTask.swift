//
//  AddNewTask.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct AddNewTask: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var fromWhichScreen: String
    @Binding  var task: [Tasks]
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var taskName: String = ""
    @State private var error : Bool = false
    @Binding var selectedTask: Tasks?
    

    var body: some View {
        
      
        VStack {
            Text(fromWhichScreen == "HomeView" ? "Add New Task" : "Edit Task")
                .font(.title)
                .fontWeight(.bold)
                            
            TextField("Enter Task", text: $taskName )
                .padding()
                .frame(alignment : .top)
                .addBgToTextField()
              
            Button(action:
                    {
                    saveAndUpdateTask()
            }) {
                Text(fromWhichScreen == "HomeView" ? "Save Task" : "Update Task")
                    .loginSingUpBtnText()
                    
            }
            .padding(.vertical)
            .btnTOuchEffect()
        }
        .padding()
        .alert(isPresented : $error){
            AlertManager.showAlert(title: alertTitle, message: alertMessage)
        }
        .onAppear{
            if let selected = selectedTask{
                taskName = selected.title
            }
        }
        Spacer()
    }
    
    private func saveAndUpdateTask() {
        if taskName.isEmpty {
            alertTitle = "Error"
            alertMessage = "Please enter task"
            error = true
            return
        }
        else {
            if fromWhichScreen == "HomeView" {
                task.append(Tasks(title: taskName))
            }
            else {
                if let selectedIndex = task.firstIndex(where: {
                    $0.id == selectedTask!.id
                }) {
                    selectedTask?.title = taskName
                    task[selectedIndex] = selectedTask!
                   
                }
            }
            TaskManager.saveTasks(task)
            selectedTask = nil
            dismiss()
        }
    }
    
    
}

#Preview {
    let task = [Tasks]()
    AddNewTask(fromWhichScreen: .constant("HomeView"),task: .constant(task), selectedTask: .constant(task.first))
}
