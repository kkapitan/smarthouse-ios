//
//  CSPickSubjectCell.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSTableViewCell.h"

//View Model
#import "CSPickSubjectCellViewModel.h"

@interface CSPickSubjectCell : CSTableViewCell

+ (CGFloat)height;

- (void)populateWithViewModel:(CSPickSubjectCellViewModel *)viewModel;

@end
