//
//  TrackHabitModel.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 16/05/23.
//

import Foundation

extension TrackHabitView {
    
    func addTrack (habitName: String, sessionName : String, date: Date, duration: Double){
        
        //check if textfield aren't empty
        if !habitName.isEmpty && !sessionName.isEmpty && !duration.isZero {
            
            //create new tracker
            let newTrack = Tracker(sessionName: sessionName, date: date, duration: duration)
            
            print("New Tracke: \(newTrack)")
            
            //finding index in the array list
            if let habitIndex = habits.activities.firstIndex(where: {$0.name == habitName}) {
                print("Habit index: \(habitIndex)")
                
                habits.activities[habitIndex].track.append(newTrack)
                print("Habit updated: \(habits.activities[habitIndex])")
                
                dismiss()
                
            } else {
                
                fatalError("There was a problem")
            }
        } else {
            
            setAlert(title: "Error", message: "Something missing")
        }
        
    }
    
}
