//
//  TableViewController.m
//  GetOnThatBus
//
//  Created by Chi Yang on 5/27/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "TableViewController.h"
#import "BusStopViewController.h"

@interface TableViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSInteger indexPath;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.busStopForDetail = [BusStop new];
    // Do any additional setup after loading the view.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    BusStop *busStopCell = [self.busStopsToShow objectAtIndex:indexPath.row];
    cell.textLabel.text = busStopCell.ctaStopName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Routes:%@", busStopCell.routes];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busStopsToShow.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BusStopViewController *detailVC = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    detailVC.currentBusStop = [self.busStopsToShow objectAtIndex:indexPath.row];
}


@end
