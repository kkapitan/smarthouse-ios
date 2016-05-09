//
//  CSBeaconActionCell.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTableViewCell.h"

//View model
#import "CSBeaconActionCellViewModel.h"

@interface CSBeaconActionCell : CSTableViewCell

- (void)populateWithViewModel:(CSBeaconActionCellViewModel *)viewModel;

@end
