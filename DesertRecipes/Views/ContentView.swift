import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("Desserts")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.meals) { meal in
                            NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                                MealItemView(meal: meal)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color(red: 1.0, green: 1.0, blue: 1.0))
                
                Spacer()
                
                BottomNavigationBar()
            }
            .background(Color.white.opacity(0.7))
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
