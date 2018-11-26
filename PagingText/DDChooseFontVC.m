//
//  DDChooseFontVC.m
//  DevelopmentLibrary
//
//  Created by 张桂杨 on 2017/5/24.
//  Copyright © 2017年 DD. All rights reserved.
//

#import "DDChooseFontVC.h"
#import "DDPagingTextVC.h"

@interface DDChooseFontVC ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray *_fontFamilyNames;
}
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation DDChooseFontVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.view addSubview:self.tableView];
     self.title = @"选择字体";
     self.automaticallyAdjustsScrollViewInsets = NO;
        self.view.backgroundColor = [UIColor whiteColor];
    _fontFamilyNames = [UIFont familyNames];
    
    
    NSLog(@"%@",_fontFamilyNames);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"行楷" style:UIBarButtonItemStylePlain target:self action:@selector(chooseCustomFont)];
}

- (void)chooseCustomFont {
    DDPagingTextVC *vc = [[DDPagingTextVC alloc] init];
    vc.fontName = @"STXingkai";
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _fontFamilyNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _fontFamilyNames[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *fontName = _fontFamilyNames[indexPath.row];
    DDPagingTextVC *vc = [[DDPagingTextVC alloc] init];
    vc.fontName = fontName;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
}


@end
