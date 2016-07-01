//
//  CalenderView.m
//  calender
//
//  Created by 董诗磊 on 16/6/29.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import "CalenderView.h"
#import "UIView+SDAutoLayout.h"
@implementation CalenderView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews{


    self.calenderArray = [[NSMutableArray alloc]init];
    self.weeklyArray = [[NSMutableArray alloc]init];
    
    [self.weeklyArray addObject:@"周日"];
    [self.weeklyArray addObject:@"周一"];
    [self.weeklyArray addObject:@"周二"];
    [self.weeklyArray addObject:@"周三"];
    [self.weeklyArray addObject:@"周四"];
    [self.weeklyArray addObject:@"周五"];
    [self.weeklyArray addObject:@"周六"];
    
    
    self.Calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [self.Calender setFirstWeekday:1];
    [self.Calender setMinimumDaysInFirstWeek:1];
    
    [self.Calender setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"0"]];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.calenderCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.calenderCollectionView.backgroundColor = [UIColor redColor];
    
    
    self.calenderCollectionView.delegate = self;
    self.calenderCollectionView.dataSource = self;
    [self.calenderCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.calenderCollectionView];
    self.calenderCollectionView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    //第一天是周几
    
    
    self.weekIndex = [[CalenderHelper calende]firstWeekdayInThisMonth:[NSDate date] with:nil];
    
    //这个月有几天
    self.range = [[CalenderHelper calende] HowManyDayinThisMonth:self.Calender Date:[NSDate date]];
   
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    if (section == 0)
    {
        return self.weeklyArray.count;
    }
    else{
        return self.range.length+self.weekIndex;
    }
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.titelLabel.text = self.weeklyArray[indexPath.row];
    }
    else
    {
        if (indexPath.row < self.weekIndex)
        {
            cell.titelLabel.text = @"";
        }else
            if (indexPath.row>self.weekIndex + self.range.length) {
                cell.titelLabel.text = @"";
            }else
            {
                NSInteger day = indexPath.row - self.weekIndex+1;
                
                cell.titelLabel.text = [NSString stringWithFormat:@"%ld",(long)day];
                
            }
        
        
    }
    return cell;
    
    
    
}
//被选择时的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];


}
//每一个cell的大熊啊
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/7, 40);
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;

}
- (void)nextMouth
{
    NSDateFormatter * format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    if (self.date.length == 0)
    {
        NSString * str = [format stringFromDate:[NSDate date]];
        self.date = [[NSMutableString alloc]initWithString:str];
    }
    
    
    NSInteger month = [[_date substringWithRange:NSMakeRange(5,2)]integerValue];
    NSInteger year = [[_date substringWithRange:NSMakeRange(0,4)]integerValue];
    
    if ( month < 12)
    {
        [_date replaceCharactersInRange:NSMakeRange(5,2) withString:[NSString stringWithFormat:@"%.2ld",month + 1]];
    }
    else
    {
        [_date replaceCharactersInRange:NSMakeRange(0,7) withString:[NSString stringWithFormat:@"%ld-01",year + 1]];
        
    }
    
    NSDate * newDate = [format dateFromString:_date];
    
    
    self.range = [[CalenderHelper calende] HowManyDayinThisMonth:self.Calender Date:newDate];
    self.weekIndex = [[CalenderHelper calende]firstWeekdayInThisMonth:newDate with:nil];
    [self.calenderCollectionView reloadData];
    
    
}

@end
