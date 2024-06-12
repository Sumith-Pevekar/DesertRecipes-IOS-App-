import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                ContentView()
            } else {
                VStack {
                    Image(systemName: "sparkles")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Welcome to Dessert Recipes")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 20)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.95, green: 0.95, blue: 1.0), Color(red: 0.8, green: 0.8, blue: 0.9)]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
        )
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
