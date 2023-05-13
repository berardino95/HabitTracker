//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import SwiftUI

struct HabitDetailView: View {
    
    let habit : Habit
    
    var body: some View {
        NavigationView {
            Text("Text")
        }
        .navigationTitle(habit.name)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit(name: "Text", track: []))
    }
}
