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
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                    Text("Desserts World")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 35.0)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.95, green: 0.75, blue: 0.75), Color(red: 0.9, green: 0.4, blue: 0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
