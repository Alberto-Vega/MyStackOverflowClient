//
//  MenuContainerViewController.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "MenuContainerViewController.h"
#import "MyProfileViewController.h"
#import "QuestionSearchViewController.h"
#import "MyQuestionsViewController.h"

CGFloat const kBurgerOpenScreenDivider = 3.0;
CGFloat const kBurgerOpenScreenMultiplier = 2.0;
CGFloat const kBurgerButtonWidth = 50.0;
CGFloat const kBurgerButtonHeight = 50.0;

NSTimeInterval const kTimeToSlideMenuOpen = 0.2;

@interface MenuContainerViewController ()<UITableViewDelegate>

@property (strong, nonatomic) MenuTableViewController *leftMenuViewController;
@property (strong, nonatomic) MainContentViewController *topViewController;
@property (strong, nonatomic) MyQuestionsViewController *myQuestionsViewController;

@property(strong, nonatomic) UIButton *burgerButton;
@property(strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property(strong, nonatomic) NSArray *viewControllers;

@end

@implementation MenuContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllViewControllers];
    
    [self setupPanGesture];
    [self setupBurgerButton];
}

//MARK: View Controller Setup

- (void)setupAllViewControllers {
    [self setupMenuViewController];
//    [self setupMainContentViewController];
//    [self setupAdditionalMenuViewControllers];
    
    self.viewControllers = @[self.topViewController, self.myQuestionsViewController];
}

- (BOOL)prefersStatusBarHidden {
    return true;
}

- (void)setupMenuViewController {
    QuestionSearchViewController *leftMenuVC = [self.storyboard instantiateInitialViewController: @"LeftMenuVC"];
    leftMenuVC.tableView.delegate = self;
    
    
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
