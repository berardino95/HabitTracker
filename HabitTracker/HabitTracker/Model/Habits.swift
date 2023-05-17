//
//  Habits.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var activities = [Habit]() {
        didSet {
            //Encode to user defaults
            if let encoded = try? JSONEncoder().encode(activities){
                UserDefaults.standard.set(encoded, forKey: "list")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "list") {
            if let decodedList = try? JSONDecoder().decode([Habit].self, from: savedItems){
                activities = decodedList
                return
            }
        }
        activities = []
    }
    
    var habitKeys : [String] {
        var keys : [String] = []
        for item in activities {
            keys.append(item.name)
        }
        return keys
    }   
    
}
