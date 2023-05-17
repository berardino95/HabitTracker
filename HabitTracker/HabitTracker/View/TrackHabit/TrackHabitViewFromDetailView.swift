//
//  TrackHabitViewFromDetailView.swift
//  HabitTracker
//
//  Created by Berardino Chiarello on 17/05/23.
//

import SwiftUI

struct TrackHabitViewFromDetailView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var habit: Habit
    
    @State private var sessionName = ""
    @State private var date = Date.now
    @State private var numbOfHours = 0.0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertIsShowed = false
    
    var body: some View {
            Form{
                
                TextField("Session Name", text: $sessionName)
                
                DatePicker("When?", selection: $date)
                
                TextField("Time", value: $numbOfHours, format: .number)
                    .keyboardType(.decimalPad)
                
                Button("Confirm"){
                    addTrack(habit: &habit, sessionName: sessionName, date: date, duration: numbOfHours)
                    self.presentation.wrappedValue.dismiss()
                }
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

struct TrackHabitViewFromDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrackHabitViewFromDetailView(habit: .constant(Habit.example))
    }
}
