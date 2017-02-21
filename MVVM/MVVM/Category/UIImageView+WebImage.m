//
//  UIImageView+WebImage.m
//  demo
//
//  Created by 向乾操 on 16/3/5.
//  Copyright © 2016年 向乾操. All rights reserved.
//

#import "UIImageView+WebImage.h"

@implementation UIImageView (WebImage)

- (void)setImageUrl:(NSString *)url placeHolder:(UIImage *)image {
    self.image = image;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage * urlImage = nil;
        NSURL * URL = [NSURL URLWithString:url];
        NSData * imageData = [NSData dataWithContentsOfURL:URL];
        urlImage = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (urlImage != nil) {
                self.image = image;
            }
        });
    });
}

@end
