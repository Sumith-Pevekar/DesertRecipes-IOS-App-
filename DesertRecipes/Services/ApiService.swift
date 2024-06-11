import Foundation
import Combine

class ApiService {
    func fetchDesserts() -> AnyPublisher<[Meal], Error> {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealList.self, decoder: JSONDecoder())
            .map { $0.meals.sorted { $0.strMeal < $1.strMeal } }
            .eraseToAnyPublisher()
    }
    
    func fetchMealDetails(id: String) -> AnyPublisher<MealDetails, Error> {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealDetail.self, decoder: JSONDecoder())
            .map { $0.meals.first! }
            .eraseToAnyPublisher()
    }
}
