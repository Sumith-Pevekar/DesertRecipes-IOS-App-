import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel()
    let mealId: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let meal = viewModel.mealDetail {
                    
                    
                    Text(meal.strMeal)
                        .font(.title)
                        .bold()
                        .padding([.horizontal, .top])
                    HStack {
                    Spacer()
                    URLImage(url: meal.strMealThumb)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 20)
                    Spacer()
                }
                .padding(.horizontal)

                    
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Text(meal.strInstructions)
                        .padding([.horizontal, .bottom])
                        .lineSpacing(5)
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(meal.ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                } else if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    Text("Error loading meal details")
                        .padding()
                }
            }
            .padding(.top)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .navigationTitle(viewModel.mealDetail?.strMeal ?? "Meal Details")
        }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .onAppear {
            viewModel.fetchMealDetails(id: mealId)
        }
    }
}
