//
//  ViewController.m
//  MVVM
//
//  Created by 会骑牛的小七 on 2017/2/21.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "MVVMTableViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.viewModel getData];
    
    [self.viewModel addObserver:self forKeyPath:[ViewModel keyPaht] options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel rowsOfSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MVVMTableViewCell"];
    cell.data = [self.viewModel cellDataWithIndexPath:indexPath];
    return cell;
}

- (void)dealloc {
    [self.viewModel removeObserver:self forKeyPath:[ViewModel keyPaht]];
}

@end
