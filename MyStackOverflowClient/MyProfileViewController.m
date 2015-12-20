//
//  MyProfileViewController.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "MyProfileViewController.h"
#import "SOMyUserProfileAPIService.h"
#import "SOUserJSONParser.h"
#import "User.h"

@interface MyProfileViewController ()

@property (strong, nonatomic) User *myUserProfile;

@end

@implementation MyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.profileImageView setClipsToBounds: YES];
    self.profileImageView.layer.cornerRadius = 5.0;
    [self loadMyUserProfileInfo];
    
     
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayMyUserInfo:(User *)myUserProfile {
    _myUserProfile = myUserProfile;
    self.profileName.text = myUserProfile.displayName;
    self.reputationLabel.text = [NSString stringWithFormat:@"%i", myUserProfile.reputation];
    
    //Download Image
    
    dispatch_queue_t imageQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(imageQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:myUserProfile.profileImageURL];
        UIImage *profileImage = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        self.myUserProfile.profileImage = profileImage;
        self.profileImageView.image = profileImage;
        });
    });
}

- (void)loadMyUserProfileInfo {
    [SOMyUserProfileAPIService fetchMyProfileInfoWithCompletion:^(id  _Nullable data, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        if (data) {
            [SOUserJSONParser parseMyUserInfoFromDictionary:data completion:^(User * _Nullable user, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                    return;
                }
                if (user) {
                    [self displayMyUserInfo:user];
                }
            }];
        }
    }];
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
