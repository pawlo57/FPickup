#import "OfferCell.h"
#import <QuartzCore/QuartzCore.h>

@interface OfferCell ()

@property (strong,nonatomic) UILabel *cellTitleLabel;

@end

@implementation OfferCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
      //  [self.layer setCornerRadius:5.0f];
        
        UIImage *image = [UIImage imageNamed:@"ic_launcher.png"];
        
        self.imageViewLogo.image = image;
        
        self.labelDesc.text = @"dfdfd";
        
        // cellTitle label
        _cellTitleLabel = [[UILabel alloc] init];
        _cellTitleLabel.frame = CGRectMake(92, 13, 208, 32);
        [_cellTitleLabel setBackgroundColor:[UIColor clearColor]];
        [_cellTitleLabel setFont:[UIFont fontWithName:@"Futura-CondensedExtraBold" size:23]];
        [_cellTitleLabel setTextColor:[UIColor blackColor]];
        
        [self.contentView addSubview:_cellTitleLabel];
        
        [self.layer setCornerRadius:7.0f];
        [self.layer setMasksToBounds:YES];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
