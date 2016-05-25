//
//  LSPCoreDataOperation.h
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^progressCallback)(BOOL isCompleted, float progress, NSError* error);

@interface LSPCoreDataOperation : NSOperation
-(instancetype)initWithJSONFileNames:(NSString *)jsonFile entityName:(NSString *)entityName persistanceStore:(NSPersistentStoreCoordinator *)store progressCallback:(progressCallback)progressCallback;
@end
