//
//  BusStop.m
//  GetOnThatBus
//
//  Created by Chee Vue on 5/27/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "BusStop.h"

@implementation BusStop

-(BusStop *)initWithBusStop:(NSDictionary *)object {
    BusStop *busStop = [BusStop new];
    busStop.ctaStopName = object[@"cta_stop_name"];
    busStop.routes = object[@"routes"];
    NSString *string = object[@"longitude"];
    busStop.longitude = [string doubleValue];
    string = object[@"latitude"];
    busStop.latitude = [string doubleValue];
    busStop.intermodalTransfer = object[@"inter_modal"];

    return busStop;
}

@end
