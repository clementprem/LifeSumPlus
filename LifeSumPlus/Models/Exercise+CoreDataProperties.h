//
//  Exercise+CoreDataProperties.h
//  
//
//  Created by Clement on 5/25/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Exercise.h"

NS_ASSUME_NONNULL_BEGIN

@interface Exercise (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *addedbyuser;
@property (nullable, nonatomic, retain) NSNumber *calories;
@property (nullable, nonatomic, retain) NSNumber *custom;
@property (nullable, nonatomic, retain) NSNumber *deleted;
@property (nullable, nonatomic, retain) NSNumber *downloaded;
@property (nullable, nonatomic, retain) NSNumber *hidden;
@property (nullable, nonatomic, retain) NSNumber *lastUpdated;
@property (nullable, nonatomic, retain) NSNumber *oID;
@property (nullable, nonatomic, retain) NSNumber *photoVersion;
@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
