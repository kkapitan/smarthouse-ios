//
//  CSPickSubjectCell.m
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSPickSubjectCell.h"

//Category
#import "UIImageView+AFNetworking.h"

@interface CSPickSubjectCell ()

@property (weak, nonatomic) IBOutlet UIImageView *subjectImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectNameLabel;

@end

@implementation CSPickSubjectCell

+ (CGFloat)height {
    return 76.0f;
}

- (void)populateWithViewModel:(CSPickSubjectCellViewModel *)viewModel {
    [_subjectImageView setImageWithURL:viewModel.subjectImageURL placeholderImage:nil];
    
    self.subjectNameLabel.text = viewModel.subjectName;
}

@end
