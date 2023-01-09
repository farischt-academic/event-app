//
//  ContentView.swift
//  EventApp
//
//  Created by Faris Chtatou on 23/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var events = [Event]()
    
    var body: some View {
        
        NavigationView{
            List(events) { event in
                NavigationLink {
                    EventDetailView(event: event)
                } label: {
                    EventListRowView(event: event)
                }
            }
            .listStyle(GroupedListStyle())
            .onAppear() {
                RequestFactory().getEventList(callback: {(error, events) in
                    self.events = [Event]()
                    if let eventList = events {
                        self.events = eventList
                    }
                })
            }.navigationTitle("Event List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
