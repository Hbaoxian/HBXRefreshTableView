//
//  HBXTableViewController.h
//  HBXTeFreshTableView
//
//  Created by 黄保贤 on 16/6/7.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#define RGBACOLOR(c)                                \
[UIColor colorWithRed:(((c)>>24)&0xFF)/255.0    \
green:(((c)>>16)&0xFF)/255.0    \
blue:(((c)>> 8)&0xFF)/255.0    \
alpha:(((c)>> 0)&0xFF)/255.0]

#define RGBCOLOR(c)        RGBACOLOR(((c) << 8) | 0xFF)

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class HBXTableItem;

@interface HBXTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    EGORefreshTableHeaderView *_refreshHeaderView;
    
}

@property (nonatomic, strong) EGORefreshTableHeaderView *refreshHeaderView;
@property (nonatomic, assign) BOOL enableEGORefresh;
@property (nonatomic, strong) UITableView *tableView;


- (void)egoStartLoading;
- (void)egoEndLoading;





@end
