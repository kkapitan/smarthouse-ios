//
//  CSTimerTriggerDailyViewController.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 31.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerTriggerDailyViewController.h"

//Views
#import "CSHourPicker.h"
#import "CSNumberPicker.h"
#import "MultiSelectSegmentedControl.h"

//Formatter
#import "CSDateFormatter.h"

//View Model
#import "CSTimerTriggerDailyViewModel.h"

@interface CSTimerTriggerDailyViewController ()

@property (weak, nonatomic) IBOutlet UITextField *hourTextField;
@property (weak, nonatomic) IBOutlet UITextField *minuteTextField;

@property (weak, nonatomic) IBOutlet UITextField *startingFromTextField;
@property (weak, nonatomic) IBOutlet UITextField *endingWithTextField;

@property (weak, nonatomic) IBOutlet MultiSelectSegmentedControl *weekDaysSegmentedControl;

@property (strong, nonatomic) CSTimerTriggerDailyViewModel *viewModel;

@end

@implementation CSTimerTriggerDailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSTimerTriggerDailyViewModel new];
    
    [self setupTextFields];
}

//Dirty fix to prevent embed table view from scrolling on keyboard appearance
- (void)viewWillAppear:(BOOL)animated {}

- (void)reloadData {
    self.hourTextField.text = [NSString stringWithFormat:@"%ld", (unsigned long)_viewModel.configuration.hours];
    
    self.minuteTextField.text = [NSString stringWithFormat:@"%ld", (unsigned long)_viewModel.configuration.minutes];
    
    self.startingFromTextField.text = [[CSDateFormatter hourMinuteDateFormatter] stringFromDate:_viewModel.configuration.startHour];
    
    self.endingWithTextField.text = [[CSDateFormatter hourMinuteDateFormatter] stringFromDate:_viewModel.configuration.finishHour];
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
    _startingFromTextField.inputView = [[CSHourPicker alloc] initWithPickHourBlock:^(CSHourPicker *picker, NSDate *date) {
        wSelf.viewModel.configuration.startHour = date;
        
        [wSelf reloadData];
    }];
    
    _endingWithTextField.inputView = [[CSHourPicker alloc] initWithPickHourBlock:^(CSHourPicker *picker, NSDate *date) {
        wSelf.viewModel.configuration.finishHour = date;
        
        [wSelf reloadData];
    }];

    
    _hourTextField.inputView = [[CSNumberPickerView alloc] initWithMinValue:0 maxValue:23 block:^(NSInteger number) {
        wSelf.viewModel.configuration.hours = (NSUInteger)number;
        
        [wSelf reloadData];
    }];
    
    _minuteTextField.inputView = [[CSNumberPickerView alloc] initWithMinValue:0 maxValue:59 block:^(NSInteger number) {
        wSelf.viewModel.configuration.minutes = (NSUInteger)number;
        
        [wSelf reloadData];
    }];

}

#pragma mark -
#pragma mark - Actions

- (IBAction)weekDaysSegmentedControlValueChanged:(MultiSelectSegmentedControl *)segmentedControl {
    _viewModel.configuration.weekdays = segmentedControl.selectedSegmentIndexes;
}

@end
