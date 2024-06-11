import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.meals) { meal in
                        NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                            MealItemView(meal: meal)
                        }
                    }
                }
                .padding()
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95)) // Light background color
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetchDesserts()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
            .alert(isPresented: .constant(viewModel.error != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.error?.localizedDescription ?? "An unknown error occurred"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct MealItemView: View {
    let meal: Meal
    @State private var isHovered = false
    
    var body: some View {
        VStack {
            ZStack {
                URLImage(url: meal.strMealThumb)
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1))
                
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
            
            Text(meal.strMeal)
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .frame(width: 150, height: 40)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
        .padding()
    }
}
