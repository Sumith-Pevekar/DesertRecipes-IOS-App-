import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetails?
    @Published var isLoading = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = ApiService()
    
    func fetchMealDetails(id: String) {
        isLoading = true
        apiService.fetchMealDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { mealDetail in
                self.mealDetail = mealDetail
            })
            .store(in: &cancellables)
    }
}
