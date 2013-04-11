#import "LoginViewController.h"
#import "MainMenuViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setButtonLogin:nil];
    [super viewDidUnload];
}

- (IBAction)buttonLoginPress:(UIButton *)sender {
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
    
    [self.navigationController pushViewController: mainMenuViewController animated:YES];
}

@end
