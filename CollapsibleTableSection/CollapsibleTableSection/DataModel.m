//
//  DataModel.m
//  CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
+ (instancetype)initName:(NSString *)name
                   items:(NSArray *)items
                 collapsed:(BOOL)collapsed {
    DataModel *data = [DataModel new];
    data.name = name;
    data.items = items;
    data.collapsed = NO;
    return data;
}
@end
