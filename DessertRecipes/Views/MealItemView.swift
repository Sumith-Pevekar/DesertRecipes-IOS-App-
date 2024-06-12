import SwiftUI

struct MealItemView: View {
    let meal: Meal

    var body: some View {
        VStack {
            URLImage(url: meal.strMealThumb)
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
                .clipShape(RoundedCorner(radius: 15, corners:[.topLeft, .topRight]))
                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 5)
            if meal.strMeal.count > 15 {
                MarqueeText(text: meal.strMeal)
                    .frame(width: 160)
            } else {
                Text(meal.strMeal)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.top, 5)
                    .frame(width: 160)
                    .bold()
            }
        }
        .padding(.bottom, 10)
        .background(Color.white.opacity(0.7))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.4), radius: 15, x: 0, y: 40)
    }
}
