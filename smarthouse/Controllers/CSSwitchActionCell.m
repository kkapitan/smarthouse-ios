//
//  CSSwitchedActionCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSwitchActionCell.h"

//Category
#import "UIImageView+AFNetworking.h"

@interface CSSwitchActionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@end

@implementation CSSwitchActionCell

- (void)populateWithViewModel:(CSSwitchActionCellViewModel *)viewModel {
    [_subjectImageView setImageWithURL:viewModel.subjectImageURL placeholderImage:nil];
    
    _subjectNameLabel.text = viewModel.subjectName;
    _actionSwitch.on = viewModel.isSwitched;
}

@end
