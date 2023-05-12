//
//  Habits.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var list = [Habit]() {
        didSet {
            //Encode to user defaults
            if let encoded = try? JSONEncoder().encode(list){
                UserDefaults.standard.set(encoded, forKey: "list")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "list") {
            if let decodedList = try? JSONDecoder().decode([Habit].self, from: savedItems){
                list = decodedList
                return
            }
        }
        list = []
    }
}
