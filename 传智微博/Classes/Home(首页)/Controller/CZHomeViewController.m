//
//  CZHomeViewController.m
//  传智微博
//
//  Created by mac on 2017/12/19.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CZHomeViewController.h"
#import "UIBarButtonItem+Item.h"
#import "CZTitleButton.h"
#import "CZDrowListView.h"
#import "CZTitleTableViewController.h"
#import "UIView+Frame.h"
#import "CZStatusTool.h"
#import "CZStatus.h"
#import "CZStatusCell.h"
#import "CZStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
@interface CZHomeViewController ()<drowListViewDelegate>



/** 微博数据集*/
@property(nonatomic,strong) NSMutableArray *statusesFrame;

@end

@implementation CZHomeViewController

static NSString *identifier = @"cellID";

#pragma mark - 懒加载
-(NSMutableArray *)statusesFrame{
    if(_statusesFrame == nil){
        _statusesFrame = [NSMutableArray array];
    }
    return _statusesFrame;
}


#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableVieW 的背景颜色
    self.tableView.backgroundColor = CZColor(254, 254, 254);
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //设置导航条
    [self setUpNavgationBar];
    
    //加载最新的微博数据
     [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatusesData)];
    //自动刷新
    [self.tableView headerBeginRefreshing];
    
    //加载更多的微博数据
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatusesData)];
    

    
    
    

}

#pragma mark - 设置导航条
-(void)setUpNavgationBar{

  
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highlightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendSearch)];
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"]  highlightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"]  target:self action:@selector(pop)];
    
    //设置中间的标题
    CZTitleButton *titleButton = [CZTitleButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];

    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
                                  
                                  
    
    
}

#pragma mark - 添加好友
-(void)friendSearch{
    NSLog(@"%s",__func__);
}

#pragma mark - 二维码
-(void)pop{
    NSLog(@"%s",__func__);
}


#pragma mark - 点击标题事件
-(void)titleClick:(UIButton *)titleButton{
    
//   UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
//    //添加蒙板
//    UIView *coverView = [[UIView alloc] init];
//    coverView.backgroundColor = [UIColor clearColor];
//    coverView.frame = window.bounds;
//    //将蒙板添加到最上层的窗体上
//    [window addSubview:coverView];
//    
//    //在蒙板上添加灰色的imageview
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage stretchableImageWithImage:@"popover_background"];
//    imageView.width = 217;
//    imageView.height = 110;
//    imageView.x = (self.view.width / 2) * 0.5;
//    imageView.y = 50;
//    [coverView addSubview:imageView];
    
    //创建下拉菜单
    CZDrowListView *drowlistView = [CZDrowListView menu];
    drowlistView.delegage = self;
    //设置显示具体的内容
    CZTitleTableViewController  *vc = [[CZTitleTableViewController alloc] init];
    vc.view.height = 44 * 3;
    vc.view.width = 150;
    drowlistView.contentController = vc;
    
    [drowlistView showFrom:titleButton];
    
}

#pragma mark - 下拉菜单销毁
-(void)drowListViewDismiss:(CZDrowListView *)drowMenu{
    UIButton *titleView = (UIButton *)self.navigationItem.titleView;
    titleView.selected = NO;
}

#pragma mark - 下拉菜单显示
-(void)drowListViewShow:(CZDrowListView *)drowMenu{
    UIButton *titleView = (UIButton *)self.navigationItem.titleView;
    titleView.selected = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusesFrame.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//

    //取出statues数据
//    CZStatus *status = self.statuses[indexPath.row];
//    // 用户昵称
//    cell.textLabel.text = status.user.name;
//    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
//    cell.detailTextLabel.text = status.text;
    CZStatusCell *cell =[CZStatusCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusesFrame[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CZStatusFrame *statusF = self.statusesFrame[indexPath.row];
    
    return statusF.cellHeight;
}

//选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CZLog(@"%ld",indexPath.row);
}

#pragma mark - 获取最新微博数据
-(void)loadNewStatusesData{
    
    NSUInteger sinceId = 0;
    if(self.statusesFrame.count){
        sinceId = (NSInteger)[[self.statusesFrame[0] status] idstr];
    }
    
    [CZStatusTool newStatusesWithSinceID:sinceId success:^(NSArray *statuses){
        
        //结束上拉刷新
        [self.tableView headerEndRefreshing];
        
        // 模型转换视图模型 CZStatus -> CZStatusFrame
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (CZStatus *status in statuses) {
            //创建CZStatusFrame
            CZStatusFrame *statusFrame = [[CZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
            
        }
        
        //索引集
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statusFrameArray.count)];
        
        //将微博数据插入最上面
        [self.statusesFrame insertObjects:statusFrameArray atIndexes:indexSet];
        
 
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - 获取更多微博数据
-(void)loadMoreStatusesData{
    
    NSUInteger maxID = 0;
    
    if(self.statusesFrame.count){
        maxID =  [[[[self.statusesFrame  lastObject] status] idstr] longLongValue] - 1;
        
       // NSLog(@"%lu",(unsigned long)maxID);
    }
    
    [CZStatusTool moreStatusWithMaxID:maxID success:^(NSArray *statuses) {
      
        //结束下拉刷新
        [self.tableView footerEndRefreshing];
        // 模型转换视图模型 CZStatus -> CZStatusFrame
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (CZStatus *status in statuses) {
            //创建CZStatusFrame
            CZStatusFrame *statusFrame = [[CZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
            
        }
        //将微博数组数据加载到statuses中
        [self.statusesFrame addObjectsFromArray:statusFrameArray];
        
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
}
@end
