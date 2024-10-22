//
//  ClassRoomView.swift
//  Plandamonium
//
//  Created by Gcode on 8/19/24.
//

import SwiftUI

struct ClassRoomView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: sidebarView()) {
                    Image(systemName: "sidebar.right")
                        .font(.title)
                }
                .offset(x: 160, y: -350)
                
                
                
                
                Text("English")
            }
                }
    
    }
}

#Preview {
    ClassRoomView()
}
