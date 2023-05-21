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
                List{
                    ForEach($habits.activities, id:\.id) { $habit in
                        NavigationLink{
                            HabitDetailView(habit: $habit)
                        } label: {
                            HStack{
                                Text(habit.name)
                                Spacer()
                                Text("\(habit.stats.formatted())h")
                                    .font(.caption.weight(.black))
                                    .padding(5)
                                    .frame(minWidth: 50)
                                    .background(color(for: habit))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .onDelete{ indexSet in
                        habits.activities.remove(atOffsets: indexSet)
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
    
    func color(for habit:Habit) -> Color {
        switch habit.stats {
        case 0..<3:
            return .orange
        case 3..<10:
            return .orange
        case 10..<20:
            return .green
        case 20..<50:
            return .blue
        default:
            return .indigo
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
