//
//  CZNewFeatureController.m
//  传智微博
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CZNewFeatureController.h"
#import "CZNewFeatureCell.h"
#import "UIView+Frame.h"
@interface CZNewFeatureController ()

@property(nonatomic,weak) UIPageControl *currentPageControl;
@end

@implementation CZNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    //设置流布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;//行间距
    //flowLayout.minimumInteritemSpacing = 0;//单元格的间距
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;//每个item的尺寸
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flowLayout];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CZNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES; //开启分页
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    //设置page页
    [self setPageControll];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPageControll{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.center = CGPointMake(self.view.width * 0.5, self.view.height - 15);
    
    [self.view addSubview:pageControl];
    _currentPageControl = pageControl;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CZNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row + 1];
    cell.image = [UIImage imageNamed:imageName];

    [cell setIndexPath:indexPath count:4];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

//滚动事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //通过偏移量计算出page
    int page = scrollView.contentOffset.x / self.view.width + 0.5;
    
    _currentPageControl.currentPage = page;
    
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
