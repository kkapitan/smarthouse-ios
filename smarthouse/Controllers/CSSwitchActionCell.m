//
//  CSSwitchedActionCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionCell.h"

@interface CSSwitchActionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@property (weak, nonatomic) IBOutlet UISwitch *actionSwitch;

@property (nonatomic, strong) CSSwitchActionCellViewModel *viewModel;
@end

@implementation CSSwitchActionCell

- (void)populateWithViewModel:(CSSwitchActionCellViewModel *)viewModel {
    _subjectImageView.image = viewModel.subjectImage;
    _subjectNameLabel.text = viewModel.subjectName;
    
    _viewModel = viewModel;
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
    BOOL newValue = sender.on;
    
    [self.viewModel switchAction:newValue];
}

@end
