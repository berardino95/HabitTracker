//
//  Habit.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    
    var name: String
    var track : [Tracker]
    var id = UUID()
    
    var stats : Double {
        var sum = 0.0
        for item in track {
            sum += item.duration
        }
        return sum
    }
    
    static let example = Habit(name: "Test", track: [Tracker(sessionName: "Session 1", date: Date.now, duration: 1.0)])

}
