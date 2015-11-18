//
//  MapViewController.m
//  WOCCatalog
//
//  Created by Matija Smalcelj on 12/11/15.
//  Copyright © 2015 MSFT. All rights reserved.
//

#import "MapViewController.h"
#ifdef WINOBJC
#import <UWP/WindowsUIXamlControls.h>
#import <UWP/WindowsUIXamlControlsMaps.h>
#else
#import <MapKit/MapKit.h>
#endif

@implementation MapViewController

- (IBAction)showMapAction:(id)sender {

    
#ifdef WINOBJC
    WUXCMMapControl* mapElement= [WUXCMMapControl create];
    mapElement.mapServiceToken=@"NHsFIjVuEZfDMhkTe1hy~RBJH9Rih9OemUAoD0yogVA~Ag1kHArXjAg2Hck8lveAzRAlSDqy21FTKrXY1sRe5XOLKLDkL-DIsg45inihpYKu";
    UIView *mapView = [[UIView alloc] initWithFrame: self.view.frame];
    [mapView setNativeElement: mapElement];
    [self.view addSubview:mapView];
#else
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    
    region.center.latitude = 45.7705;
    region.center.longitude = 15.94;
    
    region.span.longitudeDelta = 0.007f;
    region.span.latitudeDelta = 0.007f;
    
    [mapView setRegion:region animated:YES];
    [mapView regionThatFits:region];
    [mapView setMapType:MKMapTypeSatellite];
    
    [self.view addSubview:mapView];
#endif

}


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
