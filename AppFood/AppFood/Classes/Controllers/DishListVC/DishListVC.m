//
//  DishListVC.m
//  AppFood
//
//  Created by ThanhSon on 3/15/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "DishListVC.h"
#import "DetailDishDto.h"
#import "DishListCell.h"
#import "DetailDishVC.h"
#import "API.h"
#import "UIView+Util.h"
#import "NewDetailDishVC.h"
#import "FileHelper.h"


@interface DishListVC () <UITableViewDelegate, UITableViewDataSource,DishListCellDelegate> {
    ListDishDetailDto *_listData;
}

@end

@implementation DishListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [_tbvDish addPullRefreshAtVC:self toReloadAction:@selector(getDataFromServer)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    self.navigationController.navigationBar.alpha = 0.3;
    [self getDataFromServer];
}

- (void)selectedButtonAdd {
    NewDetailDishVC *vc = VCFromSB(NewDetailDishVC, SB_NewDetail);
    vc.categoryId = _typeDto._id;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)initUI {
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(selectedButtonAdd)];
    self.navigationItem.rightBarButtonItem = add;
    
    _listData = [[ListDishDetailDto alloc] init];
    self.navigationItem.title = _typeDto.name;
}

- (void)getDataFromServer {
 
    if (![_tbvDish.refreshCtrl isRefreshing]) {
        [App showLoading];
    }
    [API getListDishDetail:_typeDto callback:^(BOOL success, id data) {
        [App hideLoading];
        [_tbvDish hideIndicator];
        if (success) {
            _listData = data;
            [_tbvDish reloadData];
        }
    }];
}


#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _listData.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DishListCell * cell = [_tbvDish dequeueReusableCellWithIdentifier:@"Cell"];
    
    DetailDishDto *dto = _listData.list[indexPath.row];
    cell.lblTitle.text = dto.name;
    cell.lblSubTitle.text = dto.decriptions;
    [cell.imgAvatar roundCornersOnTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius:cell.imgAvatar.frame.size.height/2];
    cell.lblTimer.text = dto.time;
    
    [cell.imgIcon sd_setImageWithURL:[NSURL URLWithString:dto.image]
                 placeholderImage:[UIImage imageNamed:@"none.9"]];
    
    if (dto.hasSave) {
        [cell.btnSave setImage:[UIImage imageNamed:@"SaveFill"] forState:UIControlStateNormal];
        [cell.btnSave setTitle:@"Saved" forState:UIControlStateNormal];
    } else {
        [cell.btnSave setImage:[UIImage imageNamed:@"Save"] forState:UIControlStateNormal];
        [cell.btnSave setTitle:@"Save" forState:UIControlStateNormal];
    }
    
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailDishVC * vc = VCFromSB(DetailDishVC,SB_ListFood);
    DetailDishDto *dto = _listData.list[indexPath.row];
    vc.foodId = dto._id;
    vc.name = dto.name;
    vc.image = dto.image;
    vc.des = dto.decriptions;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - DishListCellDelegate
- (void)dishListCell:(DishListCell *)cell didSelectedSave:(UIButton *)btn {
    NSIndexPath *indexPath = [self.tbvDish indexPathForCell:cell];
    NSInteger row = indexPath.row;
    
    DetailDishDto *dto = _listData.list[row];
    if (!dto.hasSave) {
        [FileHelper saveFoodToFavorate:dto];
        [self getDataFromServer];
    }else {
        [FileHelper removeFavorite:dto];
        [self getDataFromServer];
    }
}

- (void)dishListCell:(DishListCell *)cell didSelectedShare:(UIButton *)btn  {
    
}

@end
