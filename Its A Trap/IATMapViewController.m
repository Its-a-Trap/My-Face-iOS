//
//  IATMapViewController.m
//  Its A Trap
//
//  Created by Carlton Keedy on 5/10/14.
//  Copyright (c) 2014 Its-A-Trap. All rights reserved.
//

#import "IATMapViewController.h"
#import "SWRevealViewController.h"


@interface IATMapViewController ()

@end

@implementation IATMapViewController

@synthesize mapView;

/*
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog([locations lastObject]);
}
 */
- (IBAction)manageSweepConfirmation:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm Sweep"
                                                    message:@"Are you sure you want to sweep?"
                                                   delegate:nil
                                          cancelButtonTitle:@"No!"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        /*
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locationManager startUpdatingLocation];
         */
    }
    return self;
}

- (IBAction)unwindToTitle:(UIStoryboardSegue*)unwindSegue {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    mapView.showsUserLocation = YES;
    
    self.myTraps = [[NSMutableArray alloc] init];
    
    [self setupTrapCountButton];
    [self updateLocation];
}

- (void)setupTrapCountButton {
    self.trapCountButton = [[IATTrapCountButton alloc] init];
    self.trapCountButton.frame = CGRectMake(10, 30, 40, 40);
    
    [self updateTrapCount];
    
    [self.view addSubview:self.trapCountButton];
    [self.trapCountButton drawCircleButton:[UIColor redColor]];
}

- (void)updateTrapCount {
    int trapCount = [self.myTraps count];
    NSString *trapCountString = [@(trapCount) stringValue];
    [self.trapCountButton setTitle:trapCountString forState:UIControlStateNormal];
}

- (void)updateLocation {
    /*
     MKUserLocation *userLocation = mapView.userLocation;
     MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(
     userLocation.location.coordinate, 200000, 200000);
     */
    
    // get initial location in another method
    // if in dev mode, do A, else do B
    MKCoordinateRegion region;
    region.center.latitude = 44.4604636;
    region.center.longitude = -93.1535;
    region.span.latitudeDelta = 0.0075;
    region.span.longitudeDelta = 0.0075;
    [mapView setRegion:region];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
