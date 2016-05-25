//
//  LSPCoreDataOperation.m
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import "LSPCoreDataOperation.h"
#import <Groot/Groot.h>
#import <Groot/GRTJSONSerialization.h>

const int kSaveBatchCount = 400;

@interface LSPCoreDataOperation()
@property(strong, nonatomic)NSManagedObjectContext* backgroundMoc;
@property (nonatomic, strong)NSString* jsonFileName;
@property (nonatomic, strong)NSString* entityName;
@property (nonatomic, strong)NSPersistentStoreCoordinator* store;;
@property (nonatomic, nonnull, copy)progressCallback progressCallback;
@end

@implementation LSPCoreDataOperation

-(instancetype)initWithJSONFileNames:(NSString *)jsonFile entityName:(NSString *)entityName persistanceStore:(NSPersistentStoreCoordinator *)store progressCallback:(progressCallback)progressCallback{
    self = [super init];
    if (self) {
        _jsonFileName = jsonFile;
        _entityName = entityName;
        _store = store;
        _progressCallback = progressCallback;
    }
    return self;
}

-(void)main{
    //I know it is not good in production :)
    NSAssert(_store != nil, @"Store is nil");
    NSAssert(_entityName != nil, @"Entity name is nil");
    NSAssert(_jsonFileName != nil, @"JSON file name is nil");
    [self setupBackgroundManagedObjectContext];
    [self importDataWithLocalFile:_jsonFileName entityName:_entityName];
}

-(void)setupBackgroundManagedObjectContext{
    _backgroundMoc = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _backgroundMoc.persistentStoreCoordinator = _store;
}

-(void)importDataWithLocalFile:(NSString *)fileName entityName:(NSString *)entityName {
    if (_backgroundMoc) {
        typeof(self)weakSelf = self;
        [_backgroundMoc performBlock:^{
            NSArray *rowData = [weakSelf dictionaryWithContentsOfJSONString:fileName];
            [rowData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if(self.isCancelled) {
                    *stop = YES;
                    return;
                }
                NSError *error;
                [GRTJSONSerialization objectWithEntityName:entityName
                                        fromJSONDictionary:obj
                                                 inContext:_backgroundMoc
                                                     error:&error];
                if (idx % 3 == 0 || (idx+1) == rowData.count) {
                //Just want to use GCD
                    dispatch_async(dispatch_get_main_queue(), ^{
                        float progress = (float)(idx+1.0) /(float)rowData.count;
                        [weakSelf updateProgess:progress error:error];
                    });
                }
                if (idx % kSaveBatchCount == 0 || idx == (rowData.count-1)) {
                    [weakSelf.backgroundMoc save:nil];
                }
            }];
        }];
    }
}

-(NSArray*)dictionaryWithContentsOfJSONString:(NSString*)fileName{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

-(void)updateProgess:(float)percentage error:(NSError *)error{
    if (!_progressCallback) {
        return;
    }
    BOOL isCompleted = NO;
    float progress = 0.0;
    if (error) {
        _progressCallback(0,0,error);
        return;
    } else if (percentage>=1.0){
        isCompleted = YES;
        progress = 1;
    }
    _progressCallback(isCompleted, percentage, nil);
}
@end
