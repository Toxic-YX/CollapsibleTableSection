//
//  CollapsibleHeaderFooterView.m
//  CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

#import "CollapsibleHeaderFooterView.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

@implementation CollapsibleHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
         [self setupUI];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setupUI {
    _titleLab = [[UILabel alloc]init];
    _titleLab.frame = CGRectMake(5, 0,kScreenWidth - 40, 40);
    _titleLab.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_titleLab];
    
    _arrowImg = [[UIImageView alloc] init];
    _arrowImg.frame = CGRectMake(CGRectGetMaxX(_titleLab.frame), 10, 30, 30);
    [self.contentView addSubview:_arrowImg];
    
    [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeader:)]];
}

- (void)tapHeader:(UITapGestureRecognizer *)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didClickedSectionHeader:section:)]) {
        [self.delegate didClickedSectionHeader:self section:self.section];
    }
}
@end
