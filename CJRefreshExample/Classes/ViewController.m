//
//  ViewController.m
//  CJRefreshExample
//
//  Created by Chen_Jun on 2017/7/6.
//  Copyright © 2017年 zwu. All rights reserved.
//

#import "ViewController.h"
#import "CJRefreshControl.h"

#define CJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CJColorWithalpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-49-64) style:UITableViewStylePlain];
        _tableView.dataSource      = self;
        _tableView.delegate        = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.contentInset = UIEdgeInsetsMake(-64, 0, -49, 0);
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"XXX - xxx";
    cell.backgroundColor = CJColorWithalpha(178, 228, 255, 1.0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = CJColor(178, 228, 255);;
    [self.view addSubview:self.tableView];
    
    CJRefreshControl *refreshControl = [[CJRefreshControl alloc] initInScrollView:self.tableView];
    refreshControl.tintColor = CJColor(44, 105, 130);
    refreshControl.activityIndicatorViewColor = CJColor(44, 105, 130);
    refreshControl.arrowColor = CJColor(178, 228, 255);
    refreshControl.hasSectionHeaders = YES;
    
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)dropViewDidBeginRefreshing:(CJRefreshControl *)refreshControl
{
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
    });
}



@end
