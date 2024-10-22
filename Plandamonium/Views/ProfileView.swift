import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Tan"))
                        .padding(.leading)

                    Spacer()

                    NavigationLink(destination: sidebarView()) {
                        Image(systemName: "sidebar.right")
                            .font(.title)
                            .foregroundColor(Color("Tan"))
                    }
                    .padding(.trailing)
                }
                .padding(.top)

                VStack(spacing: 20) {
                    Image("studentpfp")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .padding()

                    VStack(alignment: .leading, spacing: 10) {
                        Text("**Name:** Jimmy Jr. Mac")
                        Text("**School:** Science Park")
                        Text("**Phone Number:** 973-546-6796")
                        Text("**Email:** gcodejj2024@gmail.com")
                        Text("**Grade:** 10th Grade")
                    }
                    .font(.title3)
                    .foregroundColor(Color("DarkBlue"))
                    .padding()
                    .background(Color("offWhite"))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .background(Color("DarkBlue").ignoresSafeArea())
        }
    }
}

#Preview {
    ProfileView()
}
