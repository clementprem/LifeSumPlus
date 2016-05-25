//
//  LSPDataImportManager.h
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^progressCallback)(BOOL isCompleted, float progress, NSError* error);

@interface LSPDataImportManager : NSObject
+(instancetype)sharedInstance;
+(BOOL)isDataImported;
+(void)setIsDataImported:(BOOL)isImported;
-(void)cancellAllOperations;
-(void)importDataWithCallback:(progressCallback)progressCallback;
@end
