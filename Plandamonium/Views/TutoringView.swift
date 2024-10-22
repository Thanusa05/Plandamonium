//
//  TutoringView.swift
//  Plandamonium
//
//  Created by Gcode on 8/12/24.
//

import SwiftUI

struct TutoringView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: sidebarView()) {
                                Image(systemName: "sidebar.right")
                                    .font(.title)
                }
                .offset(x: 160, y: -350)

                
                        
                        
                        Text("Tutoring")
                    }
                }
            }
        }
#Preview {
    TutoringView()
}
