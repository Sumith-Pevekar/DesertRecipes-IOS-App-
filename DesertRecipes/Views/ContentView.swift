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
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                
                Spacer()
                
                BottomNavigationBar()
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95)) 
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
