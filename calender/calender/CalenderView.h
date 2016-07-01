//
//  CalenderView.h
//  calender
//
//  Created by 董诗磊 on 16/6/29.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalenderHelper.h"
#import "CollectionViewCell.h"
@interface CalenderView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSCalendar * Calender;
@property(nonatomic,strong)UICollectionView * calenderCollectionView;
@property(nonatomic,strong)NSMutableArray * calenderArray;
@property(nonatomic,strong)NSMutableArray * weeklyArray;
//时间
@property (nonatomic,strong)NSMutableString * date ;

//星期几
@property(nonatomic,assign)NSInteger weekIndex;

@property(nonatomic)NSRange range;


@end
