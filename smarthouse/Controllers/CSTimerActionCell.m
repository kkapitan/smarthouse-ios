//
//  CSTimerActionCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTimerActionCell.h"

//Category
#import "UIImageView+AFNetworking.h"

@interface CSTimerActionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *nextTimeLabel;

@end

@implementation CSTimerActionCell

- (void)populateWithViewModel:(CSTimerActionCellViewModel *)viewModel {
    [_subjectImageView setImageWithURL:viewModel.subjectImageURL placeholderImage:nil];
    
    _subjectNameLabel.text = viewModel.subjectName;
    _nextTimeLabel.text = viewModel.timeRemainingString;
}

@end
