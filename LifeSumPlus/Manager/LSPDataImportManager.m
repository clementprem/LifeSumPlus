//
//  LSPDataImportManager.m
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import "LSPDataImportManager.h"
#import "LSPCoreDataOperation.h"
#import "LSPCoreDataManager.h"

NSString *const kDATA_PRE_POPULATION_COMPLETED = @"DATA_PRE_POPULATION_COMPLETED";

@interface LSPDataImportManager ()
@property (strong, nonatomic)NSOperationQueue *opetationQueue;
@property (nonatomic)float foodProgress;
@property (nonatomic)float categoryProgress;
@property (nonatomic)float exerciseProgress;
@property (nonatomic, nonnull, copy)progressCallback progressCallback;
@end

@implementation LSPDataImportManager

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static LSPDataImportManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [LSPDataImportManager new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _opetationQueue = [NSOperationQueue new];
        _opetationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    }
    return self;
}

-(void)importDataWithCallback:(progressCallback)progressCallback{
    _progressCallback = progressCallback;
     LSPCoreDataOperation *foodOperation = [self createOperationWithEntityName:@"Food" fileName:@"foodStatic.json" callBack:^(BOOL isCompleted, float progress, NSError *error) {
        _foodProgress = progress;
        [self updateOverallProgress];
    }];
    LSPCoreDataOperation *categoryOperation = [self createOperationWithEntityName:@"Category" fileName:@"categoriesStatic.json" callBack:^(BOOL isCompleted, float progress, NSError *error) {
        _categoryProgress = progress;
        [self updateOverallProgress];
    }];
    LSPCoreDataOperation *exerciseOperation = [self createOperationWithEntityName:@"Exercise" fileName:@"exercisesStatic.json" callBack:^(BOOL isCompleted, float progress, NSError *error) {
        _exerciseProgress = progress;
        [self updateOverallProgress];
    }];
    [_opetationQueue addOperation:foodOperation];
    [_opetationQueue addOperation:categoryOperation];
    [_opetationQueue addOperation:exerciseOperation];
}

-(void)cancellAllOperations {
    [_opetationQueue cancelAllOperations];
}

-(LSPCoreDataOperation *)createOperationWithEntityName:(NSString *)entityName fileName:(NSString *)fileName callBack:(progressCallback)callback{
    return [[LSPCoreDataOperation alloc]initWithJSONFileNames:fileName entityName:entityName persistanceStore:[LSPCoreDataManager sharedInstance].persistentStoreCoordinator progressCallback:callback];
}

-(void)updateOverallProgress{
    float progress  = ([self roundToTwoDecimals:_categoryProgress] + [self roundToTwoDecimals:_foodProgress] + [self roundToTwoDecimals:_exerciseProgress])/3.0;
    BOOL isCompleted = progress>=1.0;
    self.progressCallback(isCompleted, progress, nil);
    if (isCompleted) {
        [LSPDataImportManager setIsDataImported:YES];
    }
}

-(float)roundToTwoDecimals:(float)value{
    return floorf(value*100)/100;
}

+(BOOL)isDataImported{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kDATA_PRE_POPULATION_COMPLETED];
}

+(void)setIsDataImported:(BOOL)isImported{
    [[NSUserDefaults standardUserDefaults]setBool:isImported forKey:kDATA_PRE_POPULATION_COMPLETED];
}
@end
