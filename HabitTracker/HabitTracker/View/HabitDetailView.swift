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
            ForEach(habit.track) {track in
                List{
                    HStack{
                        VStack{
                            Text("Session name")
                            Text("\(track.date)")
                        }
                        Text("\(track.duration)")
                    }
                }
            }
        }
        .navigationTitle(habit.name)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit(name: "Text", track: []))
    }
}
