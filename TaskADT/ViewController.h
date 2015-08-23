//
//  ViewController.h
//  TaskADT
//
//  Created by manish sama on 8/22/15.
//  Copyright (c) 2015 Manish Sama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

