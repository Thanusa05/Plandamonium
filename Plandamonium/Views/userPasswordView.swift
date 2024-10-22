//
//  userPasswordView.swift
//  Plandamonium
//
//  Created by Gcode on 8/14/24.
//

import SwiftUI

struct userPasswordView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                NavigationLink(destination: sidebarView()) {
                                Image(systemName: "sidebar.right")
                                    .font(.title)
                }
                .offset(x: 160, y: -350)

                
                        
                        
                        Text("user password")
                    }
                }
    }
}

#Preview {
    userPasswordView()
}
