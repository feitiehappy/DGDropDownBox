# DGDropDownBox
点击按钮，在按钮的上方或者下方显示菜单选择框

USE

1、#import "DGDropBoxView.h"
    引入头文件并遵守协议dropViewBoxDataSource，dropViewBoxDelegate

2、_dropView = [DGDropBoxView dropViewWithLocationView:(UIButton *)sender dropDownViewType:DROPTEXT delegate:self];
    [self.view addSubview:_dropView];

3、dataSource

- (NSInteger) numberDropViewItems;//返回item个数

- (CGSize) dropView:(UIView *)dropView itemindex:(NSInteger)index;//单个item的size

- (NSString *) dropView:(UIView *)dropView itemTitleText:(NSInteger)index;//每个item的title

//一下方法可不执行
- (DROP_DIRECTION) dropViewOrientation;//选项框方向

4、delegate

- (void) dropViewDownBox: (UIView *)dropdown selectedItem:(NSInteger)index;//点击的回调

