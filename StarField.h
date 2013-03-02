//
//  StarField.h
//  ProjectEuler
//
//  Created by Ben Gordon on 3/1/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarField : UIView

@property (nonatomic, assign) BOOL isCreatingStars;
@property (nonatomic, assign) BOOL isMovingStars;


-(id)initWithStars:(int)num;
-(void)addStars:(int)num;
-(void)startStarField;
-(void)stopStarField;
-(UIView *)createStar;

@end
