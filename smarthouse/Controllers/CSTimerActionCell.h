//
//  CSTimerActionCell.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTableViewCell.h"

//View Model
#import "CSTimerActionCellViewModel.h"

@interface CSTimerActionCell : CSTableViewCell

- (void)populateWithViewModel:(CSTimerActionCellViewModel *)viewModel;

@end

