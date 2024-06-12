import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            NavigationBarItem(icon: "house.fill", label: "Home", color: .pink)
            Spacer()
            NavigationBarItem(icon: "heart.fill", label: "Favorites", color: .pink)
            Spacer()
            NavigationBarItem(icon: "star.fill", label: "Top", color: .pink)
            Spacer()
            NavigationBarItem(icon: "gearshape.fill", label: "Settings", color: .pink)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct NavigationBarItem: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(color)
        }
    }
}
