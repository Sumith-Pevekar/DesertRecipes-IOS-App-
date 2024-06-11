import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var meals = [Meal]()
    @Published var isLoading = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = ApiService()
    
    func fetchDesserts() {
        isLoading = true
        apiService.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { meals in
                self.meals = meals.filter { !$0.strMeal.isEmpty }
            })
            .store(in: &cancellables)
    }
}
