//
//  ViewController.m
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import "LSPFoodsListViewController.h"
#import "ASProgressPopUpView.h"
#import "LSPDataImportManager.h"
#import "MDMFetchedResultsTableDataSource.h"
#import <CoreData/CoreData.h>
#import "LifeSumPlus-Swift.h"
#import "LSPCoreDataManager.h"
#import "Food.h"

NSString *const kFoodTableIdentifier = @"foodTableIdentifier";

@interface LSPFoodsListViewController () <MDMFetchedResultsTableDataSourceDelegate>
@property (strong, nonatomic) ProgressOverlayViewController *progressView;
@property (strong, nonatomic) MDMFetchedResultsTableDataSource *tableDataSource;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end

@implementation LSPFoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_titleText) {
        self.navigationItem.title = _titleText;
    }
    [self loadData];
}

-(void)loadData{
    if ([LSPDataImportManager isDataImported]) {
        [self setupDataSource];
    } else{
        _progressView = [self.storyboard instantiateViewControllerWithIdentifier:@"processOverlay"];
        [self presentViewController:_progressView animated:NO completion:^{
            [self performSelector:@selector(importData) withObject:nil afterDelay:0.1];
        }];
    }
}

-(void)importData{
    [[LSPDataImportManager sharedInstance] importDataWithCallback:^(BOOL isCompleted, float progress, NSError *error) {
        if (!isCompleted) {
            [_progressView showProgressBar];
            [_progressView setBarProgress:progress];
        } else{
            [[LSPDataImportManager sharedInstance]cancellAllOperations];
            [_progressView setBarProgress:100.0];
            [self.progressView performSelector:@selector(hideProgressBar) withObject:nil afterDelay:1];
            [_progressView dismissViewControllerAnimated:NO completion:nil];
            [self setupDataSource];
        }
    }];
}

-(NSFetchedResultsController *)fetchedResultsController{
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    self.fetchedResultsController = [[LSPCoreDataManager sharedInstance]fetchResultControllerBuileder:@"Food" pridicate:_predicate sortDescriptor:sortDescriptor];
    return _fetchedResultsController;
}

-(void)setupDataSource{
    self.tableDataSource = [[MDMFetchedResultsTableDataSource alloc] initWithTableView:self.tableView
                                                              fetchedResultsController:[self fetchedResultsController]];
    self.tableDataSource.delegate = self;
    self.tableDataSource.reuseIdentifier = kFoodTableIdentifier;
    self.tableView.dataSource = self.tableDataSource;
}

- (void)dataSource:(MDMFetchedResultsTableDataSource *)dataSource
     configureCell:(id)cell
        withObject:(id)object {
    FoodTableCell *tableCell = (FoodTableCell *)cell;
    Food *food = (Food *)object;
    tableCell.caloieLabel.text = [[food calories]stringValue];
    tableCell.titleLabel.text = [[food title] capitalizedString];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Food *food = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSDictionary *dataDict = [LSPNutritionDataBuilder buildNutritionData:food];
    FoodNutritionViewController *nutritionVc = [[FoodNutritionViewController alloc]initWithNibName:@"FoodNutritionViewController" bundle:nil];
    [nutritionVc setDataSourceDict:dataDict];
    [nutritionVc setFoodName:food.title];
    [self presentViewController:nutritionVc animated:YES completion:nil];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    _fetchedResultsController = nil;
}
@end
