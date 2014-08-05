//
//  SuperViewController.m
//  PickerView
//
//  Created by Alexey Bukhtin on 03.08.13.
//  Copyright (c) 2013 Cheapshot. All rights reserved.
//

#import "constants.h"
#import "DDMultiPickerView.h"
#import "SuperViewController.h"

static NSInteger const kSuperViewControllerCount = 59;

@interface SuperViewController() <DDMultiPickerViewDataSource, DDMultiPickerViewDelegate>
@end

@implementation SuperViewController

- (id)init
{
    self = [super init];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _pickerView = [[DDMultiPickerView alloc] initWithFrame: self.view.bounds];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    [self.view addSubview:_pickerView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _pickerView.frame = self.view.bounds;
}

#pragma mark - Picker Delegate

- (void)pickerView:(DDMultiPickerView *)pickerView customizeTableView:(UITableView *)tableView inComponent:(NSInteger)component {    
    if (tableView.tag == kCSPickerViewFrontTableTag) {
        tableView.backgroundColor = [UIColor blueColor];
    } else {
        tableView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)pickerView:(DDMultiPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

#pragma mark - DDMultiPickerView Data Source

- (CGFloat)pickerView:(DDMultiPickerView*)pickerView heightForRowsInTableView:(UITableView *)tableView inComponent:(NSInteger)component {
    return tableView.tag == kCSPickerViewFrontTableTag ? 60.f : 30.f;
}

- (NSInteger)pickerView:(DDMultiPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return kSuperViewControllerCount;
}

- (UITableViewCell *)pickerView:(DDMultiPickerView *)pickerView tableView:(UITableView *)tableView cellForRow:(NSInteger)row inComponent:(NSInteger)component {
    // Create table cell.
    NSString *identifier = (tableView.tag == kCSPickerViewFrontTableTag ?
                                             kCSPickerViewFrontCellIdentifier :
                                             kCSPickerViewBackCellIdentifier);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        if (tableView.tag == kCSPickerViewBackTopTableTag || tableView.tag == kCSPickerViewBackBottomTableTag) {
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.f];
        } else {
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.textLabel.backgroundColor = [UIColor clearColor];
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.f];
        }
    }
    
    NSString *text = row + 1 > 9 ? [NSString stringWithFormat:@"%d", row + 1] : [NSString stringWithFormat:@"0%d", row + 1];
    
    if (tableView.tag == kCSPickerViewFrontTableTag) {
        if (component == 0) {
            text = [NSString stringWithFormat:@"%@ Min", text];
        } else {
            text = [NSString stringWithFormat:@"%@ Sec", text];
        }
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

- (NSInteger)numberOfComponentsInPickerView:(DDMultiPickerView *)pickerView {
    return 2;
}

@end
