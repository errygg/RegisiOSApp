//
//  TwitterViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 2/20/12.
//  Copyright (c) 2012 Erik R. Rygg. All rights reserved.
//

#import "TwitterViewController.h"

@implementation TwitterViewController

@synthesize tweets;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchTweets];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void) fetchTweets {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=beinfluential"]];
        NSError* error;
        if( error ) {
            NSString *errorString = @"Unable to get news. Please check your internet service.";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        } else {
            tweets = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    });
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tweets.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Twitter Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];
    NSString *text = [tweet objectForKey:@"text"];
    NSString *name = [[tweet objectForKey:@"user"] objectForKey:@"name"];
    cell.textLabel.text = text;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"by %@", name];
    NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)refresh {
    [self performSelector:@selector(fetchTweets) withObject:nil afterDelay:2.0];
    [self stopLoading];
}

@end