//
//  DataModel.h
//  CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSArray *items;
@property (assign, nonatomic) BOOL collapsed;

+ (instancetype)initName:(NSString *)name
                   items:(NSArray *)items
               collapsed:(BOOL)collapsed;
@end
