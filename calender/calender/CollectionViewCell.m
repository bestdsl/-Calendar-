//
//  CollectionViewCell.m
//  calender
//
//  Created by 董诗磊 on 16/6/3.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews{
    self.titelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.titelLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titelLabel];
    
    
    
}
@end
