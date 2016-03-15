//
//  DGDropBoxView.h
//  DGDropDownBox
//
//  Created by FSLB on 16/3/15.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGDropViewDelegate.h"


@interface DGDropBoxView : UIView

@property (nonatomic, weak, nullable) id <dropViewBoxDataSource> dataSource;
@property (nonatomic, weak, nullable) id <dropViewBoxDelegate> delegate;

@property (nonatomic, assign) DROPDOWNVIEWTYPE dropdownViewType;

/**
 *  @author Yan deguang, 16-03-15 16:03:48
 *
 *  临时保存按钮
 */
@property (nonatomic, strong, nonnull) UIView *temporaryView;
/**
 *  @author Yan deguang, 16-03-15 14:03:32
 *
 *  按钮底层父uiview
 */
@property (nonatomic, strong, nonnull) UIView *midView;

+ (instancetype _Nonnull)dropViewWithLocationView:(UIView *_Nonnull)locationView dropDownViewType:(DROPDOWNVIEWTYPE) dropdownViewType delegate:(id _Nonnull)delegate;

@end
