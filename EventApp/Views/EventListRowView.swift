//
//  EventListRowView.swift
//  EventApp
//
//  Created by Faris Chtatou on 28/12/22.
//

import SwiftUI

struct EventListRowView: View {
    
    let event : Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            Text("\(event.fields.Activity)").font(Font.system(size: 18, weight: .bold, design: Font.Design.serif)).foregroundColor(Color.black)
            
            Text("Type: ").font(Font.system(size: 16, weight: .bold , design: Font.Design.serif))
            + Text("\(event.fields.type)").font(Font.system(size: 16, weight: .medium , design: Font.Design.serif)).foregroundColor(Color.gray)
            
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
            
            Spacer()
        }
    }
}
