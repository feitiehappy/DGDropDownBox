//
//  DGDropBoxView.m
//  DGDropDownBox
//
//  Created by FSLB on 16/3/15.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "DGDropBoxView.h"

@implementation DGDropBoxView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
DGDropBoxView *dropView = nil;

+ (instancetype _Nonnull)dropViewWithLocationView:(UIView *_Nonnull)locationView
                                 dropDownViewType:(DROPDOWNVIEWTYPE)dropdownViewType
                                         delegate:(id _Nonnull)delegate{
    dropView = [[DGDropBoxView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    dropView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    dropView.temporaryView = locationView;
    dropView.delegate = delegate;
    dropView.dataSource = delegate;
    dropView.dropdownViewType = dropdownViewType;
    if(![dropView midView]){
        return nil;
    }
    [dropView addSubview:dropView.midView];
    return dropView;
}

- (UIView *) midView{
    CGRect rect = [self.temporaryView convertRect:self.temporaryView.bounds toView:nil];
    if(!_midView){
        _midView = [[UIView alloc] init];
        _midView.backgroundColor = [UIColor whiteColor];
        NSInteger count = 0;
        if(self.dataSource && [self.dataSource respondsToSelector:@selector(numberDropViewItems)]){
            count = [_dataSource numberDropViewItems];
        }
        if(count == 0){
            return nil;
        }
        
        CGFloat midView_W = 0;
        CGFloat midView_H = 0;
        for (int i=0; i<count; i++){
            CGSize size = [self itemSize:i];
            midView_H += size.height+1;
            midView_W = size.width > midView_W? size.width: midView_W;
        }
        
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(dropViewOrientation)]){
            self.direction = [self.dataSource dropViewOrientation];
        }
        if(self.direction == DROP_DIRECTION_DOWN){
            _midView.frame = CGRectMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height + 10, midView_W + 10, midView_H + 1);
            _midView.center = CGPointMake(rect.origin.x + rect.size.width/2, _midView.center.y);
            
            //三角形
            [self addTriangleLayerWithFrame:CGRectMake(rect.origin.x + rect.size.width/2 - 5, rect.origin.y + rect.size.height, 10, 10) positive:YES];
        }else{
            _midView.frame = CGRectMake(rect.origin.x + rect.size.width/2, rect.origin.y - 10 - midView_H - 1, midView_W + 10, midView_H + 1);
            _midView.center = CGPointMake(rect.origin.x + rect.size.width/2, _midView.center.y);
            
            //三角形
            [self addTriangleLayerWithFrame:CGRectMake(rect.origin.x + rect.size.width/2 - 5, rect.origin.y - 10, 10, 10) positive: NO];
        }
        [self addItemsToMidView:_midView andCount:count];
    }
    return _midView;
}

- (void) addItemsToMidView:(UIView *)midView andCount:(NSInteger)count{
    for (int i = 0; i<count; i++) {
        NSString *itemTitle;
        if(self.dataSource && [self.dataSource respondsToSelector:@selector(dropView:itemTitleText:)]){
            UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            CGSize size = [self itemSize:i];
            itemBtn.frame = CGRectMake(5, 1 + i * (size.height+1), size.width, size.height);
            
            itemTitle = [_dataSource dropView:dropView itemTitleText:i];
            [itemBtn setTitle:itemTitle forState:UIControlStateNormal];
            [itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            itemBtn.tag = i;
            
            itemBtn.backgroundColor = [UIColor clearColor];
            [midView addSubview:itemBtn];
            
            [itemBtn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
    }
}

- (void)itemClick:(UIButton *)btn{
    if(self.delegate && [self.delegate respondsToSelector:@selector(dropViewDownBox:selectedItem:)]){
        [_delegate dropViewDownBox:dropView selectedItem:btn.tag];
        [self dismiss];
    }
}

- (CGSize)itemSize:(NSInteger)index{
    CGSize size;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(dropView:itemindex:)]) {
        CGSize size = [dropView.dataSource dropView:dropView itemindex:index];
        return size;
    }
    return size;
}
 //  画三角形
- (void)addTriangleLayerWithFrame: (CGRect) frame positive : (BOOL) positive {
   
    CGFloat topY;
    CGFloat bottomY;
    
    if (positive) {
        topY = frame.origin.y;
        bottomY = topY + CGRectGetHeight(frame);
    }
    else {
        bottomY = frame.origin.y;
        topY = bottomY + CGRectGetHeight(frame);
    }
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(frame), bottomY);
    CGPoint widthPoint = CGPointMake(CGRectGetMaxX(frame), bottomY);
    CGPoint endPoint = CGPointMake(CGRectGetMidX(frame), topY);
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:startPoint];
    [path2 addLineToPoint:widthPoint];
    [path2 addLineToPoint: endPoint];
    [path2 closePath];
    
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    triangleLayer.path = path2.CGPath;
    triangleLayer.fillColor = [UIColor whiteColor].CGColor;
    
    [self.layer addSublayer: triangleLayer];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
    
}

- (void) dismiss{
    if(dropView){
        [dropView removeFromSuperview];
    }
}

@end
