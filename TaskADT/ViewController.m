//
//  ViewController.m
//  TaskADT
//
//  Created by manish sama on 8/22/15.
//  Copyright (c) 2015 Manish Sama. All rights reserved.
//

#import "ViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface ViewController ()
@property(strong,nonatomic) NSDictionary *jsonDictionary;
@property(strong,nonatomic) NSMutableArray *newsArray;

@end

static NSString *const cellIdentifier = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jsonDictionary = [NSDictionary dictionary];
    self.newsArray = [NSMutableArray array];
    
    NSString *urlString = @"http://api.nytimes.com/svc/topstories/v1/home.json?api-key=15629235341919a7b4b8b6e9344f9bca:6:72095783";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
     NSError *error = nil;
    
    self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
   
    
    NSArray *results = [NSArray arrayWithObjects:[self.jsonDictionary objectForKey:@"results"], nil];
    
    
    
    
    
   
    for (NSDictionary *resultDict in results[0]) {
        
        News *news = [[News alloc]init];
        news.imagesArray = [NSMutableArray array];
        
        news.newsTitle = [resultDict objectForKey:@"title"];
        
        NSArray *multimediaArray = [NSArray arrayWithObject:[resultDict objectForKey:@"multimedia"]];
        
       for (NSDictionary *imageDict in multimediaArray) {
    
           if ([imageDict  isEqual: @""] ) {
               
               [news.imagesArray addObject:@""];
         }
           else{
               for (NSDictionary *indivDict in imageDict) {
                   
                  [news.imagesArray addObject:[indivDict objectForKey:@"url"]];
        }
      }
    
    }
     [self.newsArray addObject:news];
  }
    
    UINib *cellNib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [self.myTableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
    
}
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    News *newsRetrieved = [self.newsArray objectAtIndex:indexPath.row];
    cell.newsTitleLabel.text = newsRetrieved.newsTitle;
    [cell.textLabel sizeToFit];
    
    NSString *imageString = [newsRetrieved.imagesArray objectAtIndex:0];
    NSURL *imageUrl = [NSURL URLWithString:imageString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *newsImage = [UIImage imageWithData:imageData];
    cell.newsImageView.image =  newsImage;
    
    
    return cell;
}

@end
