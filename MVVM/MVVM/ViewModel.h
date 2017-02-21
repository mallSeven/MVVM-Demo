//
//  ViewModel.h
//  MVVM
//
//  Created by 会骑牛的小七 on 2017/2/21.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

+ (NSString *)keyPaht;

- (void)getData;

- (NSInteger)rowsOfSection:(NSInteger)section;

- (NSMutableArray *)cellDataWithIndexPath:(NSIndexPath *)indexPath;

@end
