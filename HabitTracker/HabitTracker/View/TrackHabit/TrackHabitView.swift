//
//  TrackHabitView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import SwiftUI

struct TrackHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits

    
    @State private var habitSelected = ""
    @State private var sessionName = ""
    @State private var date = Date.now
    @State private var numbOfHours = 0.0

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertIsShowed = false
    
    var body: some View {
        ZStack(alignment: .topTrailing){
        
            Form{
                
                Picker("Your habit", selection: $habitSelected) {
                    ForEach (habits.habitKeys, id: \.self) { key in
                        Text(key)
                    }
                }
                
                TextField("Session Name", text: $sessionName)
                
                DatePicker("When?", selection: $date)
                
                TextField("Time", value: $numbOfHours, format: .number)
                    .keyboardType(.decimalPad)
                
                Button("Confirm"){
                    addTrack(habitName: habitSelected, sessionName: sessionName, date: date, duration: numbOfHours)
                }
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "x.circle.fill")
                    .padding(.horizontal, 20)
            }
            
        }
        .onAppear{
            habitSelected = habits.habitKeys[0]
        }
        
        .alert(alertTitle, isPresented: $alertIsShowed) {
            Button("Ok", role: .cancel) {}
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

struct TrackHabitView_Previews: PreviewProvider {
    static var previews: some View {
        TrackHabitView(habits: Habits())
    }
}
