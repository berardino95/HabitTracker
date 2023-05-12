//
//  Tracker.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import Foundation

struct Tracker : Codable, Identifiable {
    var date: Date
    var numbOfHours: Double
    var id = UUID()
}
