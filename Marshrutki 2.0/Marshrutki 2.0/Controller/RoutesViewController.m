//
//  RoutesViewController.m
//  Marshrutki 2.0
//
//  Created by Monro on 26.01.14.
//  Copyright (c) 2014 Andrey Starostenko. All rights reserved.
//

#import "RoutesViewController.h"
#import <AFNetworking.h>
#import "Route.h"
#import <MBProgressHUD.h>
#import "MySidePanelControllerViewController.h"

@interface RoutesViewController ()

@property(strong, nonatomic) NSMutableArray* routes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    [manager GET:@"http://marshrutki.com.ua/mu/routes.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray* rawRoute = (NSArray*)responseObject;
        
        self.routes = [[NSMutableArray alloc]init];
        
        for (NSDictionary* attributes in rawRoute) {
            [self.routes addObject:[Route initRouteWithDictionary:attributes]];
        }
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [self.tableView reloadData];
        NSLog(@"%@", self.parentViewController);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        NSLog(@"Error: %@", error);
    }];
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
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"You selected row: %@", cell.textLabel.text);
    MySidePanelControllerViewController *sidePanelController = [[MySidePanelControllerViewController alloc]init];
    [sidePanelController showCenterPanelAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route* route = (Route*)self.routes[indexPath.row];
    cell.textLabel.text = route.name;
    
    return cell;
}

@end
