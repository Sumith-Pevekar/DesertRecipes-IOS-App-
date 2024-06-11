import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel()
    let mealId: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let meal = viewModel.mealDetail {
                    URLImage(url: meal.strMealThumb)
                        .frame(height: 300)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal)
                    
                    //Text(meal.strMeal)
                      //  .font(.largeTitle)
                        //.bold()
                        //.padding([.horizontal, .top])
                    
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Text(meal.strInstructions)
                        .padding([.horizontal, .bottom])
                        .lineSpacing(5) // Add line spacing for better readability
                    
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
            .navigationTitle(viewModel.mealDetail?.strMeal ?? "Meal Details")
        }
        .onAppear {
            viewModel.fetchMealDetails(id: mealId)
        }
    }
}
