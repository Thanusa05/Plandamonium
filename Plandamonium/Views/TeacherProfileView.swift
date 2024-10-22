import SwiftUI

struct TeacherProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("DarkBlue"))
                        .padding(.leading)

                    Spacer()

                    NavigationLink(destination: sidebarView()) {
                        Image(systemName: "sidebar.right")
                            .font(.title)
                            .foregroundColor(Color("DarkBlue"))
                    }
                    .padding(.trailing)
                }
                .padding(.top)

                VStack(spacing: 20) {
                    Image("teacherpfp")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding()

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name: Mr. Aiden Gru")
                        Text("School: Science Park")
                        Text("Phone Number: 973-768-2941")
                        Text("Email: gruaiden@nps.k12.nj.us")
                        Text("Position: Teacher")
                    }
                    .font(.title3)
                    .foregroundColor(Color("Tan"))
                    .padding()
                    .background(Color("DarkBlue"))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .background(Color("Tan").ignoresSafeArea())
        }

    }
}

#Preview {
    TeacherProfileView()
}
