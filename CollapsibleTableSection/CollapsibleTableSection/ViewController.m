//
//  ViewController.m
//  CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "CollapsibleHeaderFooterView.h"

static NSString *cellID = @"cellID";
static NSString *cellHearder = @"cellHearder";
@interface ViewController ()<CollapsibleHeaderFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSMutableArray <DataModel *>*dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self config];
}
- (void)config {
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[CollapsibleHeaderFooterView class] forHeaderFooterViewReuseIdentifier:cellHearder];
}

- (void)loadData {
    [self.dataArr addObject:  [DataModel initName:@"老师" items:@[@"李老师",@"于老师",@"倪老师",@"张老师"] collapsed:NO]];
    [self.dataArr addObject:[DataModel initName:@"同学" items:@[@"小李",@"小洪",@"小张"] collapsed:NO]];
    [self.dataArr addObject:[DataModel initName:@"邻居" items:@[@"小苍",@"小狗",@"55开",@"小胖",@"小明",@"我神"] collapsed:NO]];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

#pragma mark - UITableViewDataSource  Or  UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.section].items[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

// head view
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CollapsibleHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellHearder];
    view.titleLab.text = self.dataArr[section].name;
    view.arrowImg.image = [UIImage imageNamed:@"down_arrow"];
    view.section = section;
    view.delegate = self;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArr[indexPath.section].collapsed ? 0.0 : 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (void)didClickedSectionHeader:(CollapsibleHeaderFooterView *)header section:(int)section {
    BOOL collapsed = !self.dataArr[section].collapsed;
    // 同步cell中的数据collapsed
    self.dataArr[section].collapsed = collapsed;
    if (collapsed) {
       header.arrowImg.image = [UIImage imageNamed:@"up_arrow"];
    }else {
       header.arrowImg.image = [UIImage imageNamed:@"down_arrow"];
    }
    
    [self.tableView beginUpdates];
    for (int i = 0; i < self.dataArr[section].items.count; i ++) {
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:i inSection:section] ] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }
    [self.tableView endUpdates];
}
@end
