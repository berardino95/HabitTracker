//
//  AddHabitViewModel.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import Foundation

extension AddHabitView {
    
    func addHabit(name: String){
        let checkedName = name.trimmingCharacters(in: .whitespaces)
        let newHabit = Habit(name: checkedName, track: [])
       
        guard !habits.list.contains(where: { habit in
            habit.name.lowercased() == newHabit.name.lowercased()
        }) else {
            setAlert(title: "\(newHabit.name)", message: "Already exist")
            return
        }
        
        guard !name.isEmpty else {
            setAlert(title: "There is a problem", message: "Habit is empty")
            return
        }
       
            habits.list.append(newHabit)
            dismiss()
    }
        
}
