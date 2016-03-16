//
//  DGDropViewDelegate.h
//  DGDropDownBox
//
//  Created by FSLB on 16/3/15.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#ifndef DGDropViewDelegate_h
#define DGDropViewDelegate_h

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

typedef enum : NSUInteger {
    DROP_DIRECTION_DOWN   =0,//下拉框
    DROP_DIRECTION_UP //上拉框
} DROP_DIRECTION;

typedef enum : NSUInteger {
    DROPTEXT   = 0,     //仅文字
    DROPTEXTANDIMAGR    //图片加文字
} DROPDOWNVIEWTYPE;


@protocol dropViewBoxDelegate <NSObject>

@optional
/**
 *  @author Yan deguang, 16-03-16 15:03:23
 *
 *  选择按钮
 *
 *  @param dropdown self
 *  @param index    按钮tag
 */
- (void) dropViewDownBox: (UIView *)dropdown selectedItem:(NSInteger)index;

@end

@protocol dropViewBoxDataSource <NSObject>
/**
 *  @author Yan deguang, 16-03-15 15:03:06
 *
 *  返回item个数
 *
 *  @return item.count
 */
- (NSInteger) numberDropViewItems;

/**
 *  @author Yan deguang, 16-03-15 16:03:10
 *
 *  返回每个item的size
 *
 *  @param dropView dropView
 *  @param index    第几个，从0开始
 *
 *  @return
 */
- (CGSize) dropView:(UIView *)dropView itemindex:(NSInteger)index;

- (NSString *) dropView:(UIView *)dropView itemTitleText:(NSInteger)index;//每个itemTitle
@optional
/**
 *  @author Yan deguang, 16-03-15 16:03:03
 *
 *  返回是在上面弹出还是下面弹出，默认为下面
 *
 *  @return 
 */

- (DROP_DIRECTION) dropViewOrientation;
- (NSString *) dropView:(UIView *)dropView itemImageText:(NSInteger)index;//每个itemImage


@end



#endif /* DGDropViewDelegate_h */
