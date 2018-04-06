//
//  DetailDishVC.m
//  AppFood
//
//  Created by ThanhSon on 3/9/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "DetailDishVC.h"
#import "DetailDishCell.h"
#import "UIView+Util.h"

#define offset_HeaderStop 160
#define offset_B_LabelHeader 160
#define distance_W_LabelHeader 50

@interface DetailDishVC () <UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate, UIScrollViewDelegate, HBannerDelegate> {
    
}

@end

@implementation DetailDishVC

- (void)viewDidLoad
{
    [self initUIHeader];
    [super viewDidLoad];
    
    [self initVar];
}

- (void)initUIHeader {
    [_imgAvatar roundCornersOnTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius:_imgAvatar.frame.size.height/2];
    [_vHeaderTbv setFrame:CGRectMake(0, 0, SWIDTH, 280)]; // include (160 + size View 80)
    _tbvContent.tableHeaderView = _vHeaderTbv;
    [_imgHeaderView sd_setImageWithURL:[NSURL URLWithString: _fooddish.image] placeholderImage:[UIImage imageNamed:@"logo"]];
    _lblDescHeaderTBV.text = _fooddish.decriptions;
    _lblTitleHeaderTBV.text = _fooddish.name;
    _lblHeader.text = _fooddish.name;
    _vHeaderView.clipsToBounds = YES;
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)initVar {
    if (!_fooddish) {
        _fooddish = [[DetailDishDto alloc] init];
    }
    [_tbvContent reloadData];
}

#pragma mark -
#pragma mark Tableview data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger contentRow = _fooddish.content.count + 1;
    NSInteger materialRow = _fooddish.materials.count + 1;
    NSInteger total =  contentRow + materialRow + 1;
    return total;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger contentRow = _fooddish.content.count + 1;
    NSInteger materialRow = _fooddish.materials.count + 1;
    NSInteger total =  contentRow + materialRow + 1;
    
    if (row == 0) {
        return 250;
    } else if (row > 0 && row <= materialRow)  {
        if (row == 1 || row == materialRow) {
            return 50;
        }
        return 40;
    } else if (row >= materialRow + 1 && row < total){
        if (row == materialRow + 1) {
            return 50;
        }
        else {
            return 400;
        }
    } else {
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DetailDishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoHeaderCell"];
    cell.lblIngredients.text = SF(@"%ld",_fooddish.materials.count);
    cell.lblTime.text = _fooddish.time;
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    NSInteger contentRow = _fooddish.content.count + 1;
    NSInteger materialRow = _fooddish.materials.count + 1;
    NSInteger total =  contentRow + materialRow + 1;
    
    DetailDishCell *cell;
    if (row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"YoutubeCell"];
        cell.wvYoutube.allowsInlineMediaPlayback = YES;
        cell.wvYoutube.delegate = self;
        cell.wvYoutube.mediaPlaybackRequiresUserAction = NO;
        cell.wvYoutube.mediaPlaybackAllowsAirPlay = YES;
        cell.wvYoutube.scrollView.bounces = NO;
        
        NSArray *arrStr = [_fooddish.youtube componentsSeparatedByString:@"/"];
        NSString *linkUrl = [arrStr lastObject];
        NSString *embemdHTML = SF(@"<iframe width=""%f"" height=""%f"" src=""https://www.youtube.com/embed/%@"" frameborder=""0"" allow=""autoplay; encrypted-media"" allowfullscreen></iframe>",cell.wvYoutube.frame.size.width, cell.wvYoutube.frame.size.height, linkUrl);
        [cell.wvYoutube loadHTMLString:embemdHTML baseURL:nil];

    } else if (row > 0 && row <= materialRow) {
        if (row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"IngredientHeaderCell"];
            [cell roundCornersOnTopLeft:YES topRight:YES bottomLeft:NO bottomRight:NO radius:10];
        
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"IngredientRowCell"];
            cell.lblTitle.text = _fooddish.materials[row - 2].material;
            cell.lblSubTitle.text = _fooddish.materials[row - 2].amount;
            if (_fooddish.materials.count == row - 1) {
                cell.csBotRow.constant = 5;
                cell.lineView.hidden = YES;
                [cell roundCornersOnTopLeft:NO topRight:NO bottomLeft:YES bottomRight:YES radius:10];
            } else {
                cell.csBotRow.constant = 0;
                cell.lineView.hidden = NO;
                [cell roundCornersOnTopLeft:YES topRight:YES bottomLeft:YES bottomRight:YES radius:0];
            }
        }
    } else if (row >= materialRow + 1 && row < total) {
        if (row == materialRow + 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
            cell.lblTitle.text = @"COOK STEPS";
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"StepRowCell"];
            [cell.vBanner setDataDisplay:_fooddish.content[row - materialRow - 2].arrImage];
            [cell.vBanner setMaxPageControlNumber:_fooddish.content[row - materialRow - 2].arrImage.count];
            cell.vBanner.delegate = self;

            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] init];

            NSString *stepNum = SF(@"Step %ld :\t", row - materialRow - 1);
            NSString *stepContent = _fooddish.content[row - materialRow - 2].step;

            [att appendAttributedString:[[NSAttributedString alloc] initWithString:stepNum attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Bold" size:13]}]];
            [att appendAttributedString:[[NSAttributedString alloc] initWithString:stepContent]];

            cell.lblSubTitle.attributedText = att;
        }
    }
    
    return cell;
}

#pragma mark - Action
- (IBAction)onBtnBackClicked:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ScrollDeletage

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < 0) {
        [self collapHeaderWithContentOffSetPull:scrollView.contentOffset.y];
    } else {
        [self collapHeaderWithContentOffSetUpDown:scrollView.contentOffset.y];
    }
    
}

- (void)collapHeaderWithContentOffSetPull :(float)offset {
    float height = _vHeaderView.bounds.size.height;
    float scale = -(offset) / height + 1;
    float headerSizevariation = ((height * scale) - height)/2.0;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, headerSizevariation, 0);
    transform = CATransform3DScale(transform, scale ,scale, 0);
    _vHeaderView.layer.transform = transform;
}

- (void)collapHeaderWithContentOffSetUpDown :(float)offset {
    //    float height = _vHeaderView.bounds.size.height;
    //    float scale = -(offset) / height + 1;
    CATransform3D transform = CATransform3DIdentity;
    // Header -----------
    
    transform = CATransform3DTranslate(transform, 0, MAX(-offset_HeaderStop, -offset),0);
    
    _vHeaderView.layer.transform = transform;
    
    //  ------------ Label
    
    CATransform3D labelTransform = CATransform3DMakeTranslation(0, MAX(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0);
    _lblHeader.layer.transform = labelTransform;
    
    //ViewHeader eff
    _vEff.alpha = MIN(1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader);
    
}

- (void)roundedConners:(UIRectCorner )corners withRadius:(CGFloat )radius for:(UIView *)view {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = path.CGPath;
    view.layer.mask = maskLayer;
}

@end
