//
//  ViewModel.m
//  MVVM
//
//  Created by 会骑牛的小七 on 2017/2/21.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"
#import "AFNetworking.h"
#import "XMLDictionary.h"

@interface ViewModel ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewModel

+ (NSString *)keyPaht {
    return @"dataSource";
}

- (void)getData {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    NSString *urlString = @"http://www.xzt1688.com/service.asmx/HomePageInfo";
    
    [manager GET:urlString parameters:@{@"townid": @""} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[[[XMLDictionaryParser sharedInstance] dictionaryWithParser:responseObject][@"__text"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil][@"result"];
        
        self.dataSource = [[NSDictionary dictionaryWithDictionary:dic][@"publishInfoList"] mutableCopy];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (NSInteger)rowsOfSection:(NSInteger)section {
    return self.dataSource.count;
}

//数据处理
- (NSMutableArray *)cellDataWithIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.dataSource[indexPath.row];
    NSString *img = dict[@"publishImg"];
    NSString *title = dict[@"publishTitle"];
    NSString *time = dict[@"publishTime"];
    return [@[img, title, time] mutableCopy];
}

@end
