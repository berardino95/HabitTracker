//
//  TrackHabitView.swift
//  HabitTracker
//
//  Created by CHIARELLO Berardino - ADECCO on 13/05/23.
//

import SwiftUI

struct TrackHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Button("close") {
                    dismiss()
                }
            }
        }
    }
}

struct TrackHabitView_Previews: PreviewProvider {
    static var previews: some View {
        TrackHabitView()
    }
}
