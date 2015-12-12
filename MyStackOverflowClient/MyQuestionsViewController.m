//
//  MyQuestionsViewController.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "MyQuestionsViewController.h"

@interface MyQuestionsViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *questions;

@end

@implementation MyQuestionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.table.dataSource = self;
    self.table.estimatedRowHeight = 100;
    self.table.rowHeight = UITableViewAutomaticDimension;
    [self.table registerNib:[UINib nibWithNibName:@"QuestionTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadMy];
}

-(void)reloadMy
{
    //load questions
    __weak typeof(self) weakSelf = self;
    
    [[StackWebService sharedService] myQuestionsWithCompletion:
     ^(NSDictionary * _Nullable data, NSError * _Nullable error) {
         if (error == nil)
         {
             NSLog(@"Successful search!");
             
             weakSelf.questions = [NSMutableArray new];
             NSDictionary *items = ((NSDictionary *)data)[@"items"];
             if (items)
                 for (NSDictionary *item in items)
                 {
                     Question *q = [[Question alloc] initFrom:item];
                     if (q)
                         [weakSelf.questions addObject:q];
                 }
             
             [weakSelf.table reloadData];
             [weakSelf.table layoutIfNeeded];
             
             [[StackWebService sharedService] registerImageFinish:
              ^{
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Images done loading!" message:@"They're here! Amazing!" preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                  [alert addAction:ok];
                  [weakSelf presentViewController:alert animated:YES completion:nil];
              }];
         }
         else
         {
             NSLog(@"%@", error);
         }
     }];
}

#pragma mark - table view

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionTableViewCell *cell = (QuestionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        //make a new one
        cell = [QuestionTableViewCell new];
    }
    
    cell.question = self.questions[indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questions.count;
}

@end

