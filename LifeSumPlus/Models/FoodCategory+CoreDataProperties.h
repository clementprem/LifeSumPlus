//
//  FoodCategory+CoreDataProperties.h
//  
//
//  Created by Clement on 5/25/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FoodCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface FoodCategory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *category;
@property (nullable, nonatomic, retain) NSNumber *headCategoryId;
@property (nullable, nonatomic, retain) NSNumber *lastUpdated;
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
@property (nullable, nonatomic, retain) NSNumber *oID;
@property (nullable, nonatomic, retain) NSNumber *photoVersion;
@property (nullable, nonatomic, retain) NSNumber *servingsCategory;

@end

NS_ASSUME_NONNULL_END
