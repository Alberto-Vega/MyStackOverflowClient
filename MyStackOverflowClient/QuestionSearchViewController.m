//
//  QuestionSearchViewController.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "QuestionSearchViewController.h"
#import "SOSearchAPIService.h"
#import "SOSearchJSONParser.h"
#import "Question.h"
#import "Error.h"
#import "SearchTableViewCell.h"

@interface QuestionSearchViewController () < UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
//@property(strong, nonatomic) NSError *myError;
//@property(strong, nonatomic) NSError *myError2;
//@property(strong, nonatomic) NSError *myError3;
//@property(strong, nonatomic) NSError *myError4;
//@property(strong, nonatomic) NSError *myError5;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSArray<Question*> *Questions;

@end

@implementation QuestionSearchViewController

- (void) setQuestions:(NSArray<Question *> *)Questions {
    _Questions = Questions;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMainViewController];
//    self.tableView.estimatedRowHeight = 80
    self.tableView.rowHeight = UITableViewAutomaticDimension;
//
//    NSError *stackOverflowError = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowTooManyAttempts userInfo:nil];
//    
//    NSError *anotherError = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowConnectionDown userInfo:nil];
//    
//    self.myError = [NSError errorWithDomain:@"My New Error" code:1 userInfo:nil];
//    self.myError2 = [NSError errorWithDomain:NSURLErrorDomain code:2 userInfo:nil];
//    self.myError3 = [NSError errorWithDomain:NSPOSIXErrorDomain code:3 userInfo:nil];
//    self.myError4 = [NSError errorWithDomain:NSPOSIXErrorDomain code:4 userInfo:nil];
//    self.myError5 = [NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:nil];
//    
//    NSLog(@"%@", self.myError.localizedDescription);
//    NSLog(@"%@", self.myError2.localizedDescription);
//    NSLog(@" ");
//    NSLog(@"%@", self.myError3.localizedDescription);
//    NSLog(@"%@", self.myError4.localizedDescription);
//    NSLog(@"%@", self.myError5.localizedDescription);
//    
//    NSLog(@"%@", NSPOSIXErrorDomain);
}

- (void) setupMainViewController {
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.searchBar setDelegate:self];
    
    [self fetchResultsForSearchTerm:@"hello world"];
    
    UINib *nib = [ UINib nibWithNibName:@"SearchTableViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"SearchTableViewCell"];
}

- (void) fetchResultsForSearchTerm:(NSString*)searchTerm {
    
    [SOSearchAPIService searchSimilarWithTerm:searchTerm pageNumber:0 withCompletion: ^(NSDictionary *_Nullable data, NSError *_Nullable error) {
        
        if (error == nil) {
            
            NSLog(@"Success Requesting SOSearchAPIService SOSearchAPIService*");
            [SOSearchJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
                if (error ==  nil && data != nil)  {
                    NSLog(@"\n\nSuccess Parsing SearchGetRequest\n");
                    [self setQuestions:data];
                    return;
                }
                NSLog(@"Failure ParsingSOSearchJSONParser questionsArrayFromDictionary");
                NSLog(@"%@\n\n", error.description);
            }];
            return;
        }
//        
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [alertController dismissViewControllerAnimated:true completion:nil];
//            }];
//            [alertController addAction:action];
    
//            [self presentViewController:alertController animated:true completion:nil];
        
        NSLog(@"Failure Requesting SOSearchAPIService SOSearchAPIService*\n\n");
        NSLog(@"%@\n\n", error.description);
    }];
}

#pragma mark - UITableView protocol functions

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.Questions != nil) {
        return self.Questions.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = (SearchTableViewCell*) [self.tableView dequeueReusableCellWithIdentifier:@"SearchTableViewCell"];
    
    cell.question = [self.Questions objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@", searchBar.text);
    
    NSString * searchTerm = [[self.searchBar.text stringByAppendingString:@" "] stringByAppendingString:self.searchBar.text];

    [self fetchResultsForSearchTerm: searchTerm];
    [self.tableView reloadData];
    [searchBar resignFirstResponder];

}

@end
