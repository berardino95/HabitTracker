//
//  TrackHabitViewFromDetailModel.swift
//  HabitTracker
//
//  Created by Berardino Chiarello on 17/05/23.
//

import Foundation

extension TrackHabitViewFromDetailView {
    
    
    func addTrack (habit: inout Habit, sessionName : String, date: Date, duration: Double){
        
        //check if textfield aren't empty
        if !sessionName.isEmpty && !duration.isZero {
            
            //create new tracker
            let newTrack = Tracker(sessionName: sessionName, date: date, duration: duration)
            
            print("New Tracke: \(newTrack)")
            
            habit.track.append(newTrack)
            
        } else {
            setAlert(title: "Error", message: "Something missing")
        }
        
    }
}
