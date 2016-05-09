//
//  CSBeaconActionCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSBeaconActionCell.h"

@interface CSBeaconActionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *beaconInfoLabel;

@end

@implementation CSBeaconActionCell

- (void)populateWithViewModel:(CSBeaconActionCellViewModel *)viewModel {
    _subjectImageView.image = viewModel.subjectImage;
    _subjectNameLabel.text = viewModel.subjectName;
    
    _beaconInfoLabel.text = viewModel.beaconInfoString;
}

@end
