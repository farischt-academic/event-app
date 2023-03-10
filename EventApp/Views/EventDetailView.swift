//
//  EventDetailView.swift
//  EventApp
//
//  Created by Faris Chtatou on 28/12/22.
//

import SwiftUI

struct EventDetailView: View {
    
    let event : Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Spacer()
                Text("\(event.fields.Activity)").font(Font.system(size: 22, weight: .bold, design: Font.Design.serif)).foregroundColor(Color.primary)
                
                Text("Type: ").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
                + Text("\(event.fields.type)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
                
                if let speakers = event.fields.speakers {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Speakers: ").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
                            Spacer()
                        }
                        
                        VStack(alignment: .leading){
                            Text("\(speakers.joined(separator: ", "))").font(Font.system(size: 16, weight: .regular , design: Font.Design.serif)).foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                }
                
                
                
                Text("Location: ").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
                + Text("\(event.fields.Location)").font(Font.system(size: 16, weight: .regular , design: Font.Design.serif)).foregroundColor(Color.gray)
                
                HStack{
                    VStack(alignment: .leading){
                        let startDateTime = event.fields.getStartDate()
                        Text("Start Date & Time").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
                        Text("\(startDateTime.0)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
                        Text("\(startDateTime.1)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        let endDateTime = event.fields.getEndDate()
                        Text("End Date & Time").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
                        Text("\(endDateTime.0)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
                        Text("\(endDateTime.1)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
                    }
                }
                
                if let notes = event.fields.Notes {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Notes: ").font(Font.system(size: 20, weight: .bold , design: Font.Design.serif))
                            Spacer()
                        }
                        
                        VStack(alignment: .leading){
                            Text("\(notes)").font(Font.system(size: 20, weight: .regular , design: Font.Design.serif)).foregroundColor(Color.gray).frame(minHeight: 25)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
        }.navigationTitle("Event Details")
    }
}

