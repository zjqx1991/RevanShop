#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  FlutterViewController *rootVC = (FlutterViewController *)application.keyWindow.rootViewController;
    rootVC.view.backgroundColor = [UIColor redColor];
//    rootVC.viewOpaque = NO;
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
