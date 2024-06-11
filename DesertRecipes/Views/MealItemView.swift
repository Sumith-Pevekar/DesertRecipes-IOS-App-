import SwiftUI

struct MealItemView: View {
    let meal: Meal
    @State private var isHovered = false
    
    var body: some View {
        VStack {
            ZStack {
                URLImage(url: meal.strMealThumb)
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1))
                
                if isHovered {
                    Color.black.opacity(0.5)
                        .cornerRadius(10)
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
            
            Text(meal.strMeal)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .frame(width: 150, height: 40)
        }
        .background(Color(.systemGray6)) // Add background color
    }
}
