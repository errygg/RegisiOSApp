//
//  NewsViewController.m
//  RegisApplication
//
//  Created by Erik Rygg on 11/13/11.
//  Copyright (c) 2011 Regis University. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@implementation NewsViewController

@synthesize rssItems = rssItems_;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self fetchNews];
}

- (void)fetchNews {
    RSSParser *parser = [[RSSParser alloc] initWithUrl:@"http://secure.regis.edu/regisfeeds/regisnewsrss.ashx"];
    parser.delegate = self;
    [parser parse];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)rssParser:(RSSParser *)parser errorOccurred:(NSError *)error {
    NSString *errorString = @"Unable to get news. Please check your internet service.";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:errorString
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
}

- (void)rssParser:(RSSParser *)parser parsedFeed:(RSSFeed *)feed {

    rssItems_ = [feed articles];
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [rssItems_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"NewsCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[rssItems_ objectAtIndex:indexPath.row]title];
    cell.detailTextLabel.text = [[rssItems_ objectAtIndex:indexPath.row]summary];
    
    return cell;    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsDetailViewController *newsDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetail"];
    [newsDetail setCurrentlySelectedRSSItem:[rssItems_ objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:newsDetail animated:YES];
}

- (void)refresh {
    
    [self performSelector:@selector(fetchNews) withObject:nil afterDelay:2.0];
    [self stopLoading];
}

@end
