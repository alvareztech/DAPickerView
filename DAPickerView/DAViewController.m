//
//  DAViewController.m
//  DAPickerView
//
//  Created by Daniel Alvarez on 2/4/14.
//  Copyright (c) 2014 Daniel Alvarez. All rights reserved.
//

#import "DAViewController.h"

@interface DAViewController () {
    UIPickerView *pickerView;
    UIToolbar *toolBar;
    UIBarButtonItem *doneBarButtonItem;
    
    CGRect pickerViewShownFrame;
    CGRect pickerViewHiddenFrame;
}

@end

@implementation DAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pickerViewShownFrame = CGRectMake(0.f, self.view.frame.size.height - 280.f, 320.f, 216.f);
    pickerViewHiddenFrame = CGRectMake(0.f, self.view.frame.size.height, 320.f, 216.f);
    
    pickerView = [[UIPickerView alloc] init];
    pickerView.tag = 1;
    pickerView.frame = pickerViewHiddenFrame;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.backgroundColor = [UIColor whiteColor];

    
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss:) ];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolBar.items = @[flexibleSpace, doneBarButtonItem];
    
    
    [pickerView addSubview:toolBar];
    
    [self.view addSubview:pickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openPicker:(UIButton *)sender {
    [self showPickerView];
}

- (IBAction) dismiss:(id)sender {
    NSLog(@"Dismiss");
    [self dismissPickerView];
}

#pragma mark - Picker View
- (void) showPickerView {
    [UIView animateWithDuration:0.333 animations:^{
        pickerView.frame = pickerViewShownFrame;
    }];
}

- (void)dismissPickerView {
    [UIView animateWithDuration:0.333 animations:^{
        pickerView.frame = pickerViewHiddenFrame;
    }];
}

#pragma mark Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 4;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 300;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label;
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        label.text = @"hi";
    return label;
}


@end
