//
//  IATMapViewController.h
//  Its A Trap
//
//  Created by the It's A Trap! Team on 5/10/14.
//    Adam Canady
//    Jiatao Cheng
//    Calder Coalson
//    Carlton Keedy
//    Carissa Knipe
//    Quinn Radich
//    Daniel Simmons-Marengo
//  Copyright (c) 2014 Its-A-Trap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "IATUser.h"
#import "IATTrap.h"
#import "IATTrapCountButton.h"
#import <GoogleMaps/GoogleMaps.h>

@class IATMapViewController;

@protocol IATMapViewControllerDelegate <NSObject>

- (void)addItemViewController:(IATMapViewController*)controller didFinishEnteringItem:(NSMutableArray *)item;

@end

@interface IATMapViewController : UIViewController <GMSMapViewDelegate, UIAlertViewDelegate, CLLocationManagerDelegate> {
    //CLLocationManager *locationManager;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property NSMutableArray *myActiveTraps;
@property NSMutableArray *enemyTraps;
@property UIButton *sweepButton;
@property IATTrapCountButton *trapCountButton;
@property UILabel *trapCountLabel;
@property UILabel *myScoreLabel;
@property (nonatomic, strong) CLLocation *myLocation;
@property NSMutableData *responseData;
@property NSArray *playerList;
@property NSDictionary *scoreList;
@property NSArray *highScores;


@property NSArray *myTraps;
@property NSArray *otherTraps;

@end
