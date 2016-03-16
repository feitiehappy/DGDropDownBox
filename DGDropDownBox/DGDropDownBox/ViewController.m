//
//  ViewController.m
//  DGDropDownBox
//
//  Created by FSLB on 16/3/15.
//  Copyright © 2016年 FSLB. All rights reserved.
//

#import "ViewController.h"
#import "DGDropBoxView.h"

@interface ViewController ()<dropViewBoxDataSource,dropViewBoxDelegate>

@property (nonatomic, strong) DGDropBoxView *dropView;

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnCLick:(id)sender {
    _dropView = [DGDropBoxView dropViewWithLocationView:(UIButton *)sender dropDownViewType:DROPTEXT delegate:self];
    [self.view addSubview:_dropView];
}

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"选项一",@"选项二",@"选项三",@"选项四", nil];
    }
    return _dataArray;
}

- (NSInteger)numberDropViewItems{
    return self.dataArray.count;
}

- (CGSize) dropView:(UIView *)dropView itemindex:(NSInteger)index{
    return CGSizeMake(100, 40);
}

- (NSString *)dropView:(UIView *)dropView itemTitleText:(NSInteger)index{
    return self.dataArray[index];
}

- (void)dropViewDownBox:(UIView *)dropdown selectedItem:(NSInteger)index{
    NSLog(@"%ld",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
