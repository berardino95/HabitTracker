//
//  ContentView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @StateObject private var habits = Habits()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(habits.list) { habit in
                    NavigationLink{
                        HabitDetailView(habit: habit)
                    } label: {
                        Text(habit.name)
                    }
                    Button("Print"){
                        print(habit)
                    }
                }
                .navigationTitle("Habit Tracker")
                .sheet(isPresented: $showSheet) {
                    AddOrRecView(habits: habits)
                        .presentationDetents([.fraction(0.4), .large])
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
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
