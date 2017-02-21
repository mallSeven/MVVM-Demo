//
//  Model.m
//  MVVM
//
//  Created by 会骑牛的小七 on 2017/2/21.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (instancetype)newWithDic:(NSDictionary *)dic {
    Model *train = [Model new];
    for (NSString *pro in [Model getModel]) {
        NSString *string = dic[pro];
        [train setValue:string forKey:pro];
    }
    return train;
}

+ (NSArray *)getModel {
    return @[@"publishImg", @"publishTitle", @"publishTime"];
}

@end
