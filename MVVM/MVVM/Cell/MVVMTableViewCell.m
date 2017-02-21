//
//  MVVMTableViewCell.m
//  MVVM
//
//  Created by 会骑牛的小七 on 2017/2/21.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "MVVMTableViewCell.h"
#import "UIImageView+WebImage.h"

@interface MVVMTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation MVVMTableViewCell


- (void)setData:(NSMutableArray *)data {
    if (_data != data) {
        _data = data;
        
        [self.img setImageUrl:data[0] placeHolder:[UIImage imageNamed:@"8"]];
        self.title.text = data[1];
        self.time.text = data[2];
        
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
