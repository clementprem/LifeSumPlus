//
//  ViewController.h
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSPFoodsListViewController : UITableViewController
@property (strong, nonatomic)NSPredicate *predicate;
@property (strong, nonatomic)NSString *titleText;
@end

