//
//  HBXTableViewController.m
//  HBXTeFreshTableView
//
//  Created by 黄保贤 on 16/6/7.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import "HBXTableViewController.h"

@interface HBXTableViewController () <EGORefreshTableHeaderDelegate>

@end


@implementation HBXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame  = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.backgroundColor = [UIColor clearColor];
}


- (void)setEnableEGORefresh:(BOOL)enableEGORefresh {
    if (_enableEGORefresh != enableEGORefresh) {
        _enableEGORefresh = enableEGORefresh;
        
        if (!_enableEGORefresh) {
            [self.refreshHeaderView removeFromSuperview];
            self.refreshHeaderView = nil;
        }else {
            if (self.tableView != nil && self.refreshHeaderView == nil) {
                self.refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.f, 0.f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.frame.size.height)];
                self.refreshHeaderView.backgroundColor = RGBCOLOR(0xe4e5e7);
                self.refreshHeaderView.delegate = self;
                [self.tableView addSubview:self.refreshHeaderView];
                [self.refreshHeaderView refreshLastUpdatedDate];
            }
        
        }
    }
}
#pragma mark  - scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_refreshHeaderView) {
          [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}

#pragma mark - EGORefreshDelegate

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    [self reload];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {

    return YES;
}

- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view {

    return [NSDate date];
}
- (void)egoStartLoading {
    if (self.refreshHeaderView) {
        self.tableView.contentOffset = CGPointMake(0, -75.f);
        [self.refreshHeaderView egoRefreshScrollViewDidEndDragging:self.tableView];
    }
}

- (void)egoEndLoading {
    if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
        self.tableView.contentOffset = CGPointMake(0, 0);
    }

}






- (void)reload {


}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}




@end
