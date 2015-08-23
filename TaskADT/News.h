//
//  News.h
//  TaskADT
//
//  Created by manish sama on 8/22/15.
//  Copyright (c) 2015 Manish Sama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property(strong,nonatomic) NSString *newsTitle;
@property(strong,nonatomic) NSString *newsImage;
@property(strong,nonatomic) NSMutableArray *imagesArray;

@end
