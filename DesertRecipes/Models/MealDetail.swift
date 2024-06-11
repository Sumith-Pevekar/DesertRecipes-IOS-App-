import Foundation

struct MealDetail: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    
    var id: String {
        idMeal
    }
    
    var ingredients: [String] {
        let ingredientPairs = [
            (strIngredient1, strMeasure1),
            (strIngredient2, strMeasure2),
            (strIngredient3, strMeasure3),
            (strIngredient4, strMeasure4),
            (strIngredient5, strMeasure5)
        ]
        
        return ingredientPairs.compactMap { ingredient, measure in
            guard let ingredient = ingredient, let measure = measure, !ingredient.isEmpty, !measure.isEmpty else {
                return nil
            }
            return "\(ingredient): \(measure)"
        }
    }
}
