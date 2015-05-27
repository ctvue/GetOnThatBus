//
//  ViewController.m
//  GetOnThatBus
//
//  Created by Chee Vue on 5/27/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "MapViewController.h"
#import "BusStop.h"
#import "BusStopViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <MKMapViewDelegate>
@property NSDictionary *busstops;
@property NSArray *rows;
@property NSMutableArray *allBusStops;
@property MKPointAnnotation *busstopAnnotation;
@property NSMutableArray *annotations;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.busstops = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.rows = [self.busstops valueForKey:@"row"];
        //NSLog(@"%@", self.rows);

        self.allBusStops = [NSMutableArray new];
        self.busstopAnnotation = [MKPointAnnotation new];
        self.annotations = [NSMutableArray new];

        for (NSDictionary *object in self.rows) {
            BusStop *item = [[BusStop alloc] initWithBusStop:object];
            MKPointAnnotation *annotation = [MKPointAnnotation new];
            [self.allBusStops addObject:item]; //all dictionary objects into all busstop array;
            annotation.coordinate = CLLocationCoordinate2DMake(item.latitude, item.longitude);
            annotation.title = [NSString stringWithFormat:@"%@ - Route %@", item.ctaStopName, item.routes];
            [self.annotations addObject:annotation];
            [self.mapView addAnnotation:annotation];
        }
    }];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    return pin;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    MKCoordinateRegion region = MKCoordinateRegionMake(view.annotation.coordinate, MKCoordinateSpanMake(.5,.5));

    [self.mapView setRegion:region animated:YES];

    [self performSegueWithIdentifier:@"mapToBusStopSegue" sender:view];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"mapToBusStopSegue"]) {
        MKAnnotationView *annotationView = sender;
        BusStopViewController *busstopVC = segue.destinationViewController;
//        busstopVC.ctaStopName = annotationView.annotation

        
    }
}


@end
