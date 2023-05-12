//
//  AddAbits.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct AddHabit: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertIsShowed = false
    
    var body: some View {
        Form{
            Section("Enter the habit that you want track"){
                TextField("Your habit", text: $name)
            }
            Section{
                HStack{
                    Spacer()
                    Button("Done"){
                       addHabit()
                    }
                    Spacer()
                }
            }
            
            Section{
                HStack{
                    Spacer()
                    Button("Cancel"){
                       dismiss()
                    }
                    .foregroundColor(.red)
                    Spacer()
                }
            }
        }
        .alert(alertTitle, isPresented: $alertIsShowed) {
            Button("OK", role: .cancel) {
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func addHabit(){
        let checkedName = name.trimmingCharacters(in: .whitespaces)
        let newHabit = Habit(name: checkedName, track: [])
       
        guard !habits.list.contains(where: { habit in
            habit.name.lowercased() == newHabit.name.lowercased()
        }) else {
            setAlert(title: "\(newHabit.name)", message: "already exist")
            return
        }
        
        guard !name.isEmpty else {
            setAlert(title: "Habit", message: "is empty")
            return
        }
       
            habits.list.append(newHabit)
            dismiss()

    }
    
    func setAlert(title : String, message: String) {
        alertTitle = title
        alertMessage = message
        alertIsShowed = true
    }
    
    
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
