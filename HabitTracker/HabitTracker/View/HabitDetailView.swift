//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import SwiftUI

struct HabitDetailView: View {
    
    @Binding var habit : Habit

    var body: some View {
        NavigationView {
            List{
                ForEach($habit.track) { $track in
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text(track.sessionName)
                                .font(.title2)
                            Text("\(track.date.formatted(date: .long, time: .shortened))")
                        }
                        Spacer()
                        Text("\(track.duration.formatted())h")
                            .font(.title2.bold())
                    }
                }
                .onDelete{ indexSet in
                    habit.track.remove(atOffsets: indexSet)
                }
            }
        }
        .onAppear{
            habit.track.sort{$0.date < $1.date}
        }
        .navigationTitle(habit.name)
        .toolbar {
            ToolbarItem {
                NavigationLink{
                    TrackHabitViewFromDetailView(habit: $habit)
                } label : {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: .constant(Habit.example))
    }
}
