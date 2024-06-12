import SwiftUI

struct MarqueeText: View {
    var text: String
    var font: Font = .headline
    var duration: Double = 5.0
    
    @State private var animate = false
    
    var body: some View {
        GeometryReader { geometry in
            let offset = geometry.size.width
            
            HStack {
                Text(text)
                    .font(font)
                    .foregroundColor(.primary)
                    .offset(x: animate ? -offset : offset)
                    .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false), value: animate)
            }
            .onAppear {
                animate = true
            }
        }
        .frame(height: 20)
        .clipped()
    }
}
