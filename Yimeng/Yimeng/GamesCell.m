//
//  GamesCell.m
//  Yimeng
//
//  Created by LQG on 16/2/10.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import "GamesCell.h"

@interface GamesCell ()

@property (weak, nonatomic) IBOutlet UIImageView *gamePic;
@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (weak, nonatomic) IBOutlet UILabel *gameDescription;
@property (weak, nonatomic) IBOutlet UIButton *installBtn;


@end

@implementation GamesCell

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
