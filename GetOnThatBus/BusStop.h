//
//  BusStop.h
//  GetOnThatBus
//
//  Created by Chee Vue on 5/27/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusStop : NSObject

@property NSString *ctaStopName;
@property NSString *routes;
@property double longitude;
@property double latitude;
@property NSString *intermodalTransfer;

-(BusStop *)initWithBusStop:(NSDictionary *)busStopObject;

@end
