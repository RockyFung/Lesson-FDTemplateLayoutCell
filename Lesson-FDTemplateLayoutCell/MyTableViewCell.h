//
//  MyTableViewCell.h
//  Lesson-FDTemplateLayoutCell
//
//  Created by rocky on 16/7/29.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
#import "Masonry.h"
@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong) MyModel *model;
@end
