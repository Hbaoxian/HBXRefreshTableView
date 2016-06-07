//
//  HBXTableItem.h
//  HBXTeFreshTableView
//
//  Created by 黄保贤 on 16/6/7.
//  Copyright © 2016年 黄保贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBXTableItem : NSObject

@property (nonatomic, assign) NSInteger cellHight;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) id userInfo;
@property (nonatomic, strong) Class viewClass;


@end
