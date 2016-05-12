//
//  CSSwitchedActionCell.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTableViewCell.h"

#import "CSSwitchActionCellViewModel.h"

@interface CSSwitchActionCell : CSTableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *actionSwitch;

- (void)populateWithViewModel:(CSSwitchActionCellViewModel *)viewModel;

@end
