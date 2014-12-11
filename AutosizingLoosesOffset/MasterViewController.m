//
//  MasterViewController.m
//  AutosizingLoosesOffset
//
//  Created by Jorge Leandro Perez on 12/11/14.
//  Copyright (c) 2014 Automattic. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SomeTableViewCell.h"


static NSInteger kNumberOfRows = 200;
static u_int32_t kMaximumStringLength = 300;


@interface MasterViewController ()
@property NSArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.objects = [self sampleDatasetOfSize:kNumberOfRows];
}

- (NSArray *)sampleDatasetOfSize:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSInteger i = 0; ++i <= count; ) {
        NSInteger maximumLength = (NSInteger)arc4random_uniform(kMaximumStringLength);
        [array addObject:[self randomStringOfLength:maximumLength]];
    }
    
    return array;
}

- (NSString *)randomStringOfLength:(NSUInteger)length
{
    NSMutableString *randomString   = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        char letter = arc4random_uniform(26) + 'a';
        [randomString appendFormat:@"%c", letter];
    }
    
    return randomString;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *payload       = self.objects[indexPath.row];
    NSString *identifier    = NSStringFromClass([SomeTableViewCell class]);
    SomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    cell.someLabel.text     = [NSString stringWithFormat:@"Row %ld: %@", indexPath.row, payload];
    
    return cell;
}

@end
