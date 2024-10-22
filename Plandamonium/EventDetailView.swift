////
////  EventDetailView.swift
////  Plandamonium
////
////  Created by Gcode on 8/13/24.
////
//
//import SwiftUI
//
//struct EventDetailView: View {
//    let event: Event
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(event.title)
//                .font(.headline)
//            Text("Start: \(event.startDate, formatter: dateFormatter)")
//                .font(.subheadline)
//            Text("End: \(event.endDate, formatter: dateFormatter)")
//                .font(.subheadline)
//            
//            if let url = event.url {
//                Link("More Info", destination: url)
//                    .padding(.top, 10)
//            }
//        }
//        .padding()
//        .navigationTitle("Event Details")
//    }
//}
