#import "MainMenuViewController.h"
#import "CustomNavigationButtonFactory.h"
#import "OptionsViewController.h"
#import "LoginViewController.h"
#import "ECSlidingViewController.h"
#import "OfferCell.h"

NSString *const BAR_BUTTON_SETTINGS = @"ic_action_more.png";
NSString *const BAR_BUTTON_ADD = @"ic_action_add.png";
NSString *const BAR_BUTTON_LOGO = @"ic_launcher.png";

NSString *const TABLE_VIEW_CELL_IDENTIFIER = @"OfferCell";

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewOffers;

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)setupNavigationBar {
    CustomNavigationButtonFactory *customNavigationFactory = [[CustomNavigationButtonFactory alloc] initWithNavigationController:self.navigationController];
    UIBarButtonItem *settingsBarButton = [customNavigationFactory createBarButtonWithImage:[UIImage imageNamed:BAR_BUTTON_SETTINGS] withClickHandler:nil withTarget:nil];
    UIBarButtonItem *addBarButton = [customNavigationFactory createBarButtonWithImage:[UIImage imageNamed:BAR_BUTTON_ADD] withClickHandler:nil withTarget:nil];
    
    UIBarButtonItem *logoBarButton = [customNavigationFactory createBarButtonWithImage:[UIImage imageNamed:BAR_BUTTON_LOGO] withClickHandler:nil withTarget:nil];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:logoBarButton, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:settingsBarButton,addBarButton, nil];
    [self.navigationItem setTitle:@"FPickup"];
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
       
    [self setupNavigationBar];
    
    [self.tableViewOffers registerNib:[UINib nibWithNibName:@"OfferCell" bundle:nil] forCellReuseIdentifier:TABLE_VIEW_CELL_IDENTIFIER];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupSwipeMenuController];
}


- (void)setupSwipeMenuController {
    if (![self.slidingViewController.underRightViewController isKindOfClass:[OptionsViewController class]]) {
        self.slidingViewController.underRightViewController = [[OptionsViewController alloc] initWithNibName:@"OptionsViewController" bundle:nil];
    }
    //self.slidingViewController.underLeftViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    //[self.slidingViewController setAnchorLeftRevealAmount:280.f];
    [self.slidingViewController setAnchorLeftPeekAmount:40.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //static NSString *cellIdentifier = [NSString stringWithString:TABLE_VIEW_CELL_IDENTIFIER];
    
    if(indexPath.row == 0){
       // [tableView registerClass:[OfferCell class] forCellReuseIdentifier:cellIdentifier];
    }
    
    OfferCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_CELL_IDENTIFIER];
    if(cell == nil){
        [cell.layer setCornerRadius:7.0f];
        [cell.layer setMasksToBounds: YES];
        [cell.layer setBorderWidth:2.0f];
        //[cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    }
    
    cell.imageViewLogo.image = [UIImage imageNamed:@"ic_launcher.png"];
    
    return cell;
}


#pragma marka Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 159;
}


- (void)viewDidUnload {
    [self setTableViewOffers:nil];
    [super viewDidUnload];
}
@end
