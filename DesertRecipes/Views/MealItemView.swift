import SwiftUI

struct MealItemView: View {
    let meal: Meal
    @State private var isHovered = false
    
    var body: some View {
        VStack {
            ZStack {
                URLImage(url: meal.strMealThumb)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .clipped()
                
                if isHovered {
                    Color.black.opacity(0.5)
                        .cornerRadius(20)
                    Text("Click to expand")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .onHover { hovering in
                withAnimation {
                    isHovered = hovering
                }
            }
            
            if meal.strMeal.count > 16 {
                MarqueeText(text: meal.strMeal)
                    .frame(width: 160)
            } else {
                Text(meal.strMeal)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .frame(width: 160)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}
