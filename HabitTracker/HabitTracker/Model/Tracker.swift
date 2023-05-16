//
//  Tracker.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import Foundation

struct Tracker : Codable, Identifiable {
    
    var sessionName: String
    var date: Date
    var duration: Double
    var id = UUID()
}
