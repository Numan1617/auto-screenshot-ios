//
//  OSStringTestViewController.m
//  OneSkyClientSDK
//
//  Created by Bret Cheng on 2/10/13.
//  Copyright (c) 2013 OneSky Inc. All rights reserved.
//

#import "OSStringTestViewController.h"

@interface OSStringTestViewController () <UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate> {
    
    UIPickerView* _picker;
}

@end

@implementation OSStringTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"UINavigationBar Title", nil);
    self.navigationController.title = NSLocalizedString(@"UITabBarItem", nil);
    
    NSString* localizedFormat = [NSString stringWithFormat:NSLocalizedString(@"Localizable format: %@, %d", nil), @"OneSky", 1];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSArray* strings = @[NSLocalizedString(@"Localizable string 1", nil), NSLocalizedString(@"Localizable string 2", nil), localizedFormat];
    
    CGFloat y = 0.0f;
    
    for (NSString* string in strings){
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:string forState:UIControlStateNormal];
        [button sizeToFit];
        button.frame = CGRectMake(floorf((self.view.bounds.size.width - button.frame.size.width) / 2),
                                  y,
                                  button.frame.size.width,
                                  button.frame.size.height);
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        y += button.frame.size.height;
        
        [self.view addSubview:button];
    }
    
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, y, self.view.bounds.size.width, 30.0f)];
    textView.text = NSLocalizedString(@"UITextView", nil);
    [self.view addSubview:textView];
    y += textView.frame.size.height;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, y, self.view.bounds.size.width, 30.0f)];
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"123 %@", NSLocalizedString(@"UILabel", nil)]];
    label.attributedText = attributedString;
    [self.view addSubview:label];
    y += label.frame.size.height;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"UIBarButtonItem.title", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:NULL];
    
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    searchBar.placeholder = NSLocalizedString(@"UISearchBar.placeholder", nil);
    [searchBar sizeToFit];
    searchBar.frame = CGRectMake(0.0f, y, searchBar.frame.size.width, searchBar.frame.size.height);
    [self.view addSubview:searchBar];
    
    y += searchBar.frame.size.height;
    
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:@[NSLocalizedString(@"UISegmentControl 1", nil),
                                                                                       NSLocalizedString(@"UISegmentControl 2", nil)]];
    [segmentedControl sizeToFit];
    segmentedControl.frame = CGRectMake(0.0f, y, segmentedControl.frame.size.width, segmentedControl.frame.size.height);
    [self.view addSubview:segmentedControl];
    
    y += segmentedControl.frame.size.height;
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f,
                                                                           y,
                                                                           self.view.bounds.size.width,
                                                                           30.0f)];
    textField.text = NSLocalizedString(@"UITextField", nil);
    [self.view addSubview:textField];
    
    self.navigationController.toolbarHidden = NO;
    
    NSMutableArray* toolbaritems = [NSMutableArray array];
    NSArray* toolbarTitles = @[NSLocalizedString(@"Toolbar 1", nil), NSLocalizedString(@"Toolbar 2", nil), @"Not localizable", NSLocalizedString(@"Toolbar 4", nil)];
    
    for (NSString* title in toolbarTitles){
        
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:NULL];
        [toolbaritems addObject:item];
    }
    
    self.toolbarItems = toolbaritems;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, y, self.view.bounds.size.width, self.view.bounds.size.height - y)];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    _picker = [[UIPickerView alloc] init];
    _picker.delegate = self;
    _picker.dataSource = self;
    [_picker sizeToFit];
    _picker.userInteractionEnabled = NO;
    
    [self.view addSubview:_picker];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,
                                                               self.view.bounds.size.height - 30.0f,
                                                               self.view.bounds.size.width,
                                                               30.0f)];
    label.text = NSLocalizedString(@"View added after viewDidAppear", nil);
    [self.view addSubview:label];
    
    [_picker reloadAllComponents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (void)buttonPressed:(id)sender {
    
    OSStringTestViewController* controller = [[OSStringTestViewController alloc] init];
    [self presentViewController:controller animated:YES completion:NULL];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSString* key = [NSString stringWithFormat:@"global-doodles-with-count##{%ld}", indexPath.row + 1];
    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(key, nil), indexPath.row + 1];
    cell.detailTextLabel.text = NSLocalizedString(@"UITableViewCell.detailTextLabel", nil);
    
    return cell;
}

#pragma mark - UIPickerViewDelegate
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:NSLocalizedString(@"UIPickerView %d", nil), row];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}
@end
