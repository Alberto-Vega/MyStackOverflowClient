//
//  MenuTableViewController.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "MenuTableViewController.h"
#import "Error.h"

@interface MenuTableViewController ()

@property(strong, nonatomic) NSError *myError;
@property(strong, nonatomic) NSError *myError2;
@property(strong, nonatomic) NSError *myError3;
@property(strong, nonatomic) NSError *myError4;
@property(strong, nonatomic) NSError *myError5;



@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSError *stackOverflowError = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowTooManyAttempts userInfo:nil];
    
//    NSError *anotherError = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowConnectionDown userInfo:nil];
    
    
    self.myError = [NSError errorWithDomain:@"My New Error" code:1 userInfo:nil];
    self.myError2 = [NSError errorWithDomain:NSURLErrorDomain code:2 userInfo:nil];
    
    self.myError3 = [NSError errorWithDomain:NSPOSIXErrorDomain code:3 userInfo:nil];
    self.myError4 = [NSError errorWithDomain:NSPOSIXErrorDomain code:4 userInfo:nil];
    self.myError5 = [NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:nil];
    
    NSLog(@"%@",self.myError.localizedDescription);
    NSLog(@"%@",self.myError2.localizedDescription);
    NSLog(@" ");
    
    NSLog(@"%@",self.myError3.localizedDescription);
    NSLog(@"%@",self.myError4.localizedDescription);
    NSLog(@"%@",self.myError5.localizedDescription);
    NSLog(@" ");
    
    NSLog(@"%@", NSPOSIXErrorDomain);
        
}

@end
