//
//  CSPickSubjectViewController.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 08.05.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//Model
#import "CSActionSubject.h"

@class CSPickSubjectViewController;

@protocol CSPickSubjectDelegate <NSObject>

- (void)subjectPicker:(CSPickSubjectViewController *)picker didPickActionSubject:(CSActionSubject *)subject;

@end

@interface CSPickSubjectViewController : UITableViewController

@property (nonatomic, weak) id<CSPickSubjectDelegate> delegate;

@end
