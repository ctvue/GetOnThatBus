//
//  BusStopMKPointAnnotaion.h
//  GetOnThatBus
//
//  Created by Chi Yang on 5/27/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "BusStop.h"

@interface BusStopMKPointAnnotaion : MKPointAnnotation

@property BusStop *theBusStop;

@end
