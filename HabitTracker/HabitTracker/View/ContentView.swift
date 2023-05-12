//
//  ContentView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var addHabitIsShowed = false
    @StateObject private var habits = Habits()
    
    var body: some View {
        NavigationStack {
            List(habits.list) { habit in
                NavigationLink{
                    Text(habit.name)
                } label: {
                    Text(habit.name)
                }
            }
            .navigationTitle("Habit Tracker")
            .sheet(isPresented: $addHabitIsShowed, content: {
                AddHabit(habits: habits)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addHabitIsShowed = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
