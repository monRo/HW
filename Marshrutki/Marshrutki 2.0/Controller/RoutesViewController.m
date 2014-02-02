//
//  RoutesViewController.m
//  Marshrutki 2.0
//
//  Created by Monro on 26.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "RoutesViewController.h"
#import "Route.h"
#import <MBProgressHUD.h>
#import "MySidePanelControllerViewController.h"
#import "MapViewController.h"
#import "MarshrutkiAPI.h"
#import <UIViewController+JASidePanel.h>

@interface RoutesViewController ()

@property(strong, nonatomic) NSArray* routes;
@property(strong, nonatomic) NSMutableArray *favoritesRoutes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = MENU_BACKGROUND_COLOR;

    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    [[MarshrutkiAPI sharedClients] getRoutes:^(NSArray *routes, NSError *error){
        self.routes = routes;
        [self.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
    }params:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(favoritesChanges) name:NOTIFICATION_FAV_CHANGED object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Route* route = (Route*)self.routes[indexPath.row];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectRoute:)]) {
        [self.delegate didSelectRoute:route];
    }
    
    [self.sidePanelController showCenterPanelAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route* route = (Route*)self.routes[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *FavCellIdentifier = @"FavCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:route.isFavorited?FavCellIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = route.name;
    cell.detailTextLabel.text = route.price;
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = MENU_BACKGROUND_COLOR;
    
    return view;
}

-(void)favoritesChanges{
    self.routes = [self.routes sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 isEqual:obj2];
    }];
    
    [self.tableView reloadData];
}


@end
