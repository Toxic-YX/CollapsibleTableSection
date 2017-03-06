//
//  CollapsibleHeaderFooterView.h
//  CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollapsibleHeaderFooterView;

@protocol CollapsibleHeaderFooterViewDelegate <NSObject>
- (void)didClickedSectionHeader:(CollapsibleHeaderFooterView*)header section:(int)section;
@end

@interface CollapsibleHeaderFooterView : UITableViewHeaderFooterView
@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UIImageView *arrowImg;
@property (assign, nonatomic) CGFloat section;
@property (weak, nonatomic) id<CollapsibleHeaderFooterViewDelegate>delegate;

@end
