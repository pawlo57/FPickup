#import "CustomNavigationButtonFactory.h"

const CGRect BUTTON_FRAME = {0,0,30,30};

@interface CustomNavigationButtonFactory() 
// Point to the navigation controller for later previousView and homeView button actions.
@property (weak, nonatomic) UINavigationController *navigationController;

@end

@implementation CustomNavigationButtonFactory

- (id)initWithNavigationController:(UINavigationController *)controller {
    self = [super init];
    
    if(self) {
        _navigationController = controller;
    }
    
    return self;
}

- (UIBarButtonItem *)createBarButtonWithImage:(UIImage *)image withClickHandler:(SEL)handler withTarget: (id)target {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom ];
    [self setBarButtonImage:button withImage:image];
    [self addButtonTarget:button withTarget:target withHandler:handler];
    UIView *customView = [self createCustomButtomView:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}

- (UIBarButtonItem*)createBarButtonWithTitle: (NSString*)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    UIView *buttonView = [self createCustomButtomView:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}

- (void)setBarButtonImage:(UIButton*)button withImage:(UIImage*)image {
    if(image != nil){
        [button setBackgroundImage: [image stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
        button.frame = BUTTON_FRAME;//CGRectMake(0.0, 0.0, image.size.width/2, image.size.height/2);
    }
}

- (void)addButtonTarget:(UIButton*)button withTarget:(id)target withHandler:(SEL)handler {
    if(target != nil){
        [button addTarget:target action:handler forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIView*)createCustomButtomView:(UIButton*)button {
    UIView *customView=[[UIView alloc] initWithFrame:BUTTON_FRAME];//CGRectMake(0.0, 0.0, button.frame.size.width, button.frame.size.height) ];
    [customView addSubview:button];
    
    return  customView;
}


@end
