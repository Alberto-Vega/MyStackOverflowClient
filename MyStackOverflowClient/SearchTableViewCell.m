//
//  SearchTableViewCell.m
//  
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//
//

#import "SearchTableViewCell.h"
#import "ImageFetcherService.h"

@interface SearchTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SearchTableViewCell

- (void)setQuestion:(Question *)question {
    self.userNameLabel.text = question.owner.displayName;
    self.titleLabel.text = question.title;
    
    [ImageFetcherService fetchImageInBackgroundFromUrl:question.owner.profileImageURL completionHandler:^(UIImage * _Nullable data, NSError * _Nullable error) {
        if (error) {
            
        }
        [self.imageView setImage:data];
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
