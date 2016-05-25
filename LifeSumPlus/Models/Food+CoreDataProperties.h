//
//  Food+CoreDataProperties.h
//  
//
//  Created by Clement on 5/25/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Food.h"

NS_ASSUME_NONNULL_BEGIN

@interface Food (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *addedByUser;
@property (nullable, nonatomic, retain) NSString *brand;
@property (nullable, nonatomic, retain) NSNumber *calories;
@property (nullable, nonatomic, retain) NSNumber *carbohydrates;
@property (nullable, nonatomic, retain) NSNumber *categoryId;
@property (nullable, nonatomic, retain) NSNumber *cholesterol;
@property (nullable, nonatomic, retain) NSNumber *custom;
@property (nullable, nonatomic, retain) NSNumber *defaultSize;
@property (nullable, nonatomic, retain) NSNumber *deleted;
@property (nullable, nonatomic, retain) NSNumber *downloaded;
@property (nullable, nonatomic, retain) NSNumber *fat;
@property (nullable, nonatomic, retain) NSNumber *fiber;
@property (nullable, nonatomic, retain) NSNumber *gramsPerServing;
@property (nullable, nonatomic, retain) NSNumber *hidden;
@property (nullable, nonatomic, retain) NSString *language;
@property (nullable, nonatomic, retain) NSNumber *lastUpdated;
@property (nullable, nonatomic, retain) NSNumber *mlInGram;
@property (nullable, nonatomic, retain) NSString *nameDA;
@property (nullable, nonatomic, retain) NSString *nameDE;
@property (nullable, nonatomic, retain) NSString *nameES;
@property (nullable, nonatomic, retain) NSString *nameFI;
@property (nullable, nonatomic, retain) NSString *nameFR;
@property (nullable, nonatomic, retain) NSString *nameIT;
@property (nullable, nonatomic, retain) NSString *nameNL;
@property (nullable, nonatomic, retain) NSString *nameNo;
@property (nullable, nonatomic, retain) NSString *namePL;
@property (nullable, nonatomic, retain) NSString *namePT;
@property (nullable, nonatomic, retain) NSString *nameRU;
@property (nullable, nonatomic, retain) NSString *nameSV;
@property (nullable, nonatomic, retain) NSNumber *oCategoryId;
@property (nullable, nonatomic, retain) NSNumber *oID;
@property (nullable, nonatomic, retain) NSNumber *pcInGram;
@property (nullable, nonatomic, retain) NSString *pcsText;
@property (nullable, nonatomic, retain) NSNumber *potassium;
@property (nullable, nonatomic, retain) NSNumber *protein;
@property (nullable, nonatomic, retain) NSNumber *saturatedFat;
@property (nullable, nonatomic, retain) NSNumber *servingCategory;
@property (nullable, nonatomic, retain) NSNumber *showMeasurement;
@property (nullable, nonatomic, retain) NSNumber *showonlySameType;
@property (nullable, nonatomic, retain) NSNumber *sodium;
@property (nullable, nonatomic, retain) NSNumber *sourceID;
@property (nullable, nonatomic, retain) NSNumber *sugar;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *typeOfMeasurement;
@property (nullable, nonatomic, retain) NSNumber *unsaturatedFat;

@end

NS_ASSUME_NONNULL_END
