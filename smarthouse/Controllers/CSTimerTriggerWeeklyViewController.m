//
//  CSTimerTriggerWeeklyViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 31.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerTriggerWeeklyViewController.h"

//Views
#import "CSHourPicker.h"
#import "CSNumberPicker.h"
#import "MultiSelectSegmentedControl.h"

//Formatter
#import "CSDateFormatter.h"

//View Model
#import "CSTimerTriggerWeeklyViewModel.h"

@interface CSTimerTriggerWeeklyViewController ()

@property (weak, nonatomic) IBOutlet UITextField *weeksTextField;
@property (weak, nonatomic) IBOutlet MultiSelectSegmentedControl *weekDaysSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *dayHourTextField;

@property (strong, nonatomic) CSTimerTriggerWeeklyViewModel *viewModel;

@end

@implementation CSTimerTriggerWeeklyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSTimerTriggerWeeklyViewModel new];
    
    [self setupTextFields];
}

//Dirty fix to prevent embed table view from scrolling on keyboard appearance
- (void)viewWillAppear:(BOOL)animated {}

- (void)reloadData {
    self.weeksTextField.text = [NSString stringWithFormat:@"%ld", (unsigned long)_viewModel.configuration.weeks];
    
    self.dayHourTextField.text = [[CSDateFormatter hourMinuteDateFormatter] stringFromDate:_viewModel.configuration.dayHour];
}

#pragma mark -
#pragma mark - CSTimerTriggerBuilderPageProtocol

- (void)buildTriggerWithCompletion:(CSTimerTriggerBuilderCompletion)completion {
    [self.viewModel buildTimerTriggerWithCompletion:completion];
}

#pragma mark -
#pragma mark - Private

- (void)setupTextFields {
    
    __weak typeof(self) wSelf = self;
    _dayHourTextField.inputView = [[CSHourPicker alloc] initWithPickHourBlock:^(CSHourPicker *picker, NSDate *date) {
        wSelf.viewModel.configuration.dayHour = date;
        
        [wSelf reloadData];
    }];
    
    _weeksTextField.inputView = [[CSNumberPickerView alloc] initWithMinValue:1 maxValue:4 block:^(NSInteger number) {
        wSelf.viewModel.configuration.weeks = (NSUInteger)number;
        
        [wSelf reloadData];
    }];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)weekDaysSegmentedControlValueChanged:(MultiSelectSegmentedControl *)segmentedControl {
    _viewModel.configuration.weekdays = segmentedControl.selectedSegmentIndexes;
}

@end
