#import <Foundation/Foundation.h>

// Responsible for creating custom navigation bar buttons.

@interface CustomNavigationButtonFactory : NSObject

// Init NavigationButtoNFactory with the UINavigationController so we can pop the views inside the factory class methods.
- (id)initWithNavigationController:(UINavigationController *)controller;

- (UIBarButtonItem *)createBarButtonWithImage:(UIImage *)image withClickHandler:(SEL)handler withTarget: (id)target;

@end