//
//  RootTableViewController.m
//  Lesson-FDTemplateLayoutCell
//
//  Created by rocky on 16/7/29.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "RootTableViewController.h"
#import "MyModel.h"
#import "MyTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface RootTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Feed";
    [self addDummyData];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)addDummyData{
    self.dataArray = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        MyModel *model = [[MyModel alloc]init];
        if (i % 3 == 0) {
            model.cellTitle = @"长内容";
            model.cellContext = @"恩，听上去蛮靠谱的。我们知道，UITableView 是个 UIScrollView，就像平时使用 UIScrollView 一样，加载时指定 contentSize 后它才能根据自己的 bounds、contentInset、contentOffset 等属性共同决定是否可以滑动以及滚动条的长度。而 UITableView 在一开始并不知道自己会被填充多少内容，于是询问 data source 个数和创建 cell，同时询问 delegate 这些 cell 应该显示的高度，这就造成它在加载的时候浪费了多余的计算在屏幕外边的 cell 上。和上面的 rowHeight 很类似，设置这个估算高度有两种方法： 后它才能根据自己的 bounds、contentInset、contentOffset 等属性共同决定是否可以滑动以及滚动条的长度。而 UITableView 在一开始并不知道自己会被填充多少内容，于是询问 data source 个数和创建 cell，同时询问 delegate 这些 cell 应该显示的高度，这就造成它在加载的时候浪费了多余的计算在屏幕外边的 cell 上。";
        }else if (i % 3 == 1){
            model.cellTitle = @"短内容";
            model.cellContext = @"具有动态高度内容的 cell ";
        }else{
            model.cellTitle = @"中内容";
            model.cellContext = @"具有动态高度内容的 cell 一直是个头疼的问题，比如聊天气泡的 cell， frame 布局时代通常是用数据内容反算高度具有动态高度内容的 cell 一直是个头疼的问题，比如聊天气泡的 cell， frame 布局时代通常是用数据内容反算高度具有动态高度内容的 ";
        }
        [self.dataArray addObject:model];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(MyTableViewCell * cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
}


- (void)configureCell:(MyTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.fd_enforceFrameLayout = NO; // 默认
    cell.model = self.dataArray[indexPath.row];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
