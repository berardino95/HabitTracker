//
//  AddOrRecView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import SwiftUI

struct AddOrRecView: View {
    @ObservedObject var habits: Habits
    
    @State var addHabitIsShowed = false
    @State var trackHabitIsShowed = false
    
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                Button {
                    addHabitIsShowed = true
                } label: {
                    VStack {
                        Image(systemName: "plus.diamond")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                        
                        Text("Add new habit")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
                Button{
                    trackHabitIsShowed = true
                } label: {
                    VStack {
                        Image(systemName: "plus.rectangle.on.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.gray.opacity(0.2))
                            )
                        
                        Text("Track you habit")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
                Spacer()
            }
            
        }
        .fullScreenCover(isPresented: $addHabitIsShowed) {
            AddHabitView(habits: habits)
        }
        .fullScreenCover(isPresented: $trackHabitIsShowed) {
            TrackHabitView()
        }
        
    }
}

struct AddOrRecView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrRecView(habits: Habits())
    }
}
