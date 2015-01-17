# Our main AppDelegate.  In iOS-land, when the user launches our app the system
# sets up a bunch of stuff for us. We need to give the OS an object which can
# respond to different events during that process; we refer to that object as
# the "application delegate". It gets callbacks for when the app starts, ends,
# goes to the background, gets a push notification, all sorts of fun stuff.
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'HelloMotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = nav_controller
    @window.makeKeyAndVisible

    true
  end

  private

  def nav_controller
    UINavigationController.alloc.initWithRootViewController(
      TapController.alloc.initWithNibName(nil, bundle: nil)
    )
  end
end
