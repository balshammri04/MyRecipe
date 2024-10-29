//
//  RecipeViewModel.swift
//  MyRecipe1
//
//   Created by bayan alshammri on 28/10/2024.
//

import Foundation
import SwiftUI
import PhotosUI

final class RecipeViewModel: ObservableObject {
    @Published var recipeName: String = ""
    @Published var recipeImage: UIImage?
    @Published var recipeDescription: String = ""
    @Published var showAddRecipeSheet: Bool = false
    @Published var ingredientName: String = ""
    @Published var selectedMeasurement: String = "Spoon"
    @Published var serving: Int = 1
    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [Recipe] = []
    
    // دالة لإضافة مكون إلى قائمة المكونات
    func addIngredient(name: String, measurement: String, serving: Int) {
        let newIngredient = Ingredient(name: name, measurement: measurement, serving: serving)
        ingredients.append(newIngredient)
        
        // إعادة تعيين الحقول
        ingredientName = ""
        selectedMeasurement = "Spoon"
        self.serving = 1
    }

    // دالة لإضافة وصفة جديدة إلى قائمة الوصفات
    func addRecipe() {
        // تحويل الصورة إلى بيانات
        let imageData = recipeImage?.jpegData(compressionQuality: 0.8)
        
        let newRecipe = Recipe(
            name: recipeName,
            description: recipeDescription,
            imageData: imageData,
            ingredients: ingredients
        )
        
        recipes.append(newRecipe)
        
        // إعادة تعيين الحقول بعد الإضافة
        recipeName = ""
        recipeImage = nil
        recipeDescription = ""
        ingredients = []
        
        print("Added recipe with ingredients")
        print(recipes)
    }
}


