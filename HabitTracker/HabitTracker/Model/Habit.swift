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
}
