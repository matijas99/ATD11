//
//  MapViewController.m
//  WOCCatalog
//
//  Created by Matija Smalcelj on 12/11/15.
//  Copyright © 2015 MSFT. All rights reserved.
//
#ifdef WINOBJC
#else

#import "MapViewController.h"

@interface MapViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *map;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    
    region.center.latitude = 45.771374;
    region.center.longitude = 15.943626;
    
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    
    [self.map setRegion:region animated:YES];
    [self.map regionThatFits:region];
    
    self.map.delegate = self;
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pav = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    
    NSLog(@"called viewForAnnotation");
    
    pav.pinColor = MKPinAnnotationColorGreen;
    return pav;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

#endif