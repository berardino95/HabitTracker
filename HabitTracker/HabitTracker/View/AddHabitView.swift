//
//  AddAbits.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct AddHabitView: View {
    
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
                       addHabit(name: name)
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
    
    
    
    func setAlert(title : String, message: String) {
        alertTitle = title
        alertMessage = message
        alertIsShowed = true
    }
    
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
