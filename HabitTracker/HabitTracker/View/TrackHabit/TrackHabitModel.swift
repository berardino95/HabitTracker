//
//  TrackHabitModel.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 16/05/23.
//

import Foundation

extension TrackHabitView {
    
    func addTrack (habitName: String, sessionName : String, date: Date, duration: Double){
        
        if !habitName.isEmpty && !sessionName.isEmpty && !duration.isZero {
            
            let newTrack = Tracker(sessionName: sessionName, date: date, duration: duration)
            
            if let habitIndex = habits.list.firstIndex(where: {$0.name == habitName}) {
                var habit = habits.list[habitIndex]
                habit.track.append(newTrack)
                dismiss()
                
            } else {
                
                fatalError("There was a problem")
            }
        } else {
            
            setAlert(title: "Error", message: "Something missing")
        }
        
    }
    
}
