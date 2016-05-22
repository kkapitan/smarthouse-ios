//
//  CSBeaconActionCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeaconActionCell.h"

//Category
#import "UIImageView+AFNetworking.h"

@interface CSBeaconActionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *beaconInfoLabel;

@end

@implementation CSBeaconActionCell

- (void)populateWithViewModel:(CSBeaconActionCellViewModel *)viewModel {
    [_subjectImageView setImageWithURL:viewModel.subjectImageURL placeholderImage:nil];
    
    _subjectNameLabel.text = viewModel.subjectName;
    _beaconInfoLabel.text = viewModel.beaconInfoString;
}

@end
