//
//  CSTableViewCell.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;
+ (UINib *)nib;

@end

