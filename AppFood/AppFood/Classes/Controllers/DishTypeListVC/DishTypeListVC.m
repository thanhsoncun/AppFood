//
//  DishTypeListVC.m
//  AppFood
//
//  Created by ThanhSon on 3/9/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "DishTypeListVC.h"
#import "DetailDishVC.h"
#import "DishTypeListCell.h"
#import "ListDishDto.h"
#import "DishListVC.h"
#import "UserDto.h"
#import "UIView+Util.h"

@interface DishTypeListVC () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    
    ListDishTypeDto * _arrDishType;
    
}

@end

@implementation DishTypeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self getDataFromServer];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.alpha = 0.3;
}


#pragma mark -GetDataFromServer
- (void)getDataFromServer {
    _arrDishType = [[ListDishTypeDto alloc] init];
    [App showLoading];
    [API getListTypeDish:^(BOOL success, id data) {
        [App hideLoading];
        if (success) {
            _arrDishType = data;
            [_clvListFood reloadData];
        }
    }];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}


#pragma mark - CollectionView

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float width = collectionView.frame.size.width - 5;
    float height = collectionView.frame.size.width/3;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrDishType.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DishTypeListCell *cell;
    
    if (indexPath.row % 2 == 0) {
        cell = [_clvListFood dequeueReusableCellWithReuseIdentifier:@"DishTypeListRightCell" forIndexPath:indexPath];
        DishTypeDto *dto = _arrDishType.list[indexPath.row];
        cell.lblTitle.text = dto.name;
        [cell.imgFood roundCornersOnTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius:cell.imgFood.frame.size.height andShadow:NO];
        [cell.imgFood sd_setImageWithURL:[NSURL URLWithString:dto.image]
                        placeholderImage:[UIImage imageNamed:@"none.9"]];
    } else {
        cell = [_clvListFood dequeueReusableCellWithReuseIdentifier:@"DishTypeListLeftCell" forIndexPath:indexPath];
        DishTypeDto *dto = _arrDishType.list[indexPath.row];
        cell.lblTitle.text = dto.name;
        [cell.imgFood roundCornersOnTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius:cell.imgFood.frame.size.height andShadow:NO];
        [cell.imgFood sd_setImageWithURL:[NSURL URLWithString:dto.image]
                        placeholderImage:[UIImage imageNamed:@"none.9"]];
//        [cell.imgFood sd_setImageWithURL:[NSURL URLWithString:@"https://cookbook-server.herokuapp.com/uploads/file-1524896401110.jpg"]
//                        placeholderImage:[UIImage imageNamed:@"none.9"]];
        
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DishListVC * vc = VCFromSB(DishListVC,SB_ListFood);
    DishTypeDto *dto = _arrDishType.list[indexPath.row];
    vc.typeDto = dto;

    [self.navigationController pushViewController:vc animated:YES];
}
@end
