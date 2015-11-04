

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
    var window: UIWindow?
    var rootNavigationController : UINavigationController?
    var launchedShortcutItem: UIApplicationShortcutItem?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var shouldPerformAdditionalDelegateHandling = true

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        rootNavigationController = UINavigationController (rootViewController: SBSwifty3DTouchViewController())
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            
            handleShortcut(shortcutItem)
            launchedShortcutItem = shortcutItem
            
            shouldPerformAdditionalDelegateHandling = false
        }
        
        if let shortcutItems = application.shortcutItems where shortcutItems.isEmpty {
            
            let shortcut1 = UIMutableApplicationShortcutItem (type: NSBundle.mainBundle().bundleIdentifier! + ".Search", localizedTitle: "Search", localizedSubtitle: "Will search for an item", icon: UIApplicationShortcutIcon (type: .Search), userInfo: ["firstShorcutKey1" : "Value1"])
            
            let shortcut2 = UIMutableApplicationShortcutItem (type: NSBundle.mainBundle().bundleIdentifier! + ".Share", localizedTitle: "Share", localizedSubtitle: "Will Share for an item", icon: UIApplicationShortcutIcon (type: .Share), userInfo: ["secondShorcutKey2" : "Value2"])
            
            application.shortcutItems = [shortcut1, shortcut2]
            
        }
        
        return shouldPerformAdditionalDelegateHandling
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        let handledShortCutItem = handleShortcut(shortcutItem)
        
        completionHandler(handledShortCutItem)
    }
    
    private func handleShortcut(shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        var handled = false
        
        guard let shortCutType = shortcutItem.type as String? else { return false }
        
        guard let last = shortCutType.componentsSeparatedByString(".").last else { return false }
        
        rootNavigationController?.popToRootViewControllerAnimated(false)
        
        switch (last) {
            
        case "Search":
            rootNavigationController?.pushViewController(SBSearchViewController(), animated: false)
            handled = true
            break
            
        case "Share":
            rootNavigationController?.pushViewController(SBShareViewController(), animated: false)
            handled = true
            break
            
        default:
            break
            
        }
        
        return handled
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        guard let shortcut = launchedShortcutItem else { return }
        handleShortcut(shortcut)
        launchedShortcutItem = nil
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }}

