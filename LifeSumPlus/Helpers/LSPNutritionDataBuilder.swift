//
//  LSPNutritionDataBuilder.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import UIKit

class LSPNutritionDataBuilder: NSObject {
    
   class func buildNutritionData(food : Food?) -> [String : AnyObject] {
        var data =  [String : AnyObject]()
        if let aFood = food {
            //TODO : Null checking required
            data["Cholesterol"] = aFood.cholesterol
            data["Sugar"] = aFood.sugar
            data["Fiber"] = aFood.fiber
            data["Fat"] = aFood.fat
            data["Sodium"] = aFood.sodium
            data["Potassium"] = aFood.potassium
            data["Saturated Fat"] = aFood.saturatedFat
            data["Carbohydrates"] = aFood.carbohydrates
            data["Protin"] = aFood.protein
            data["Unsaturated Fat"] = aFood.unsaturatedFat
        }
        return data
    }
}
