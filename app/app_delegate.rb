# Our main AppDelegate.  In iOS-land, when the user launches our app the system
# sets up a bunch of stuff for us. We need to give the OS an object which can
# respond to different events during that process; we refer to that object as
# the "application delegate". It gets callbacks for when the app starts, ends,
# goes to the background, gets a push notification, all sorts of fun stuff.
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setup_root

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = tab_controller
    @window.makeKeyAndVisible

    true
  end

  private

  def nav_controller
    UINavigationController.alloc.initWithRootViewController(
      TapController.alloc.initWithNibName(nil, bundle: nil)
    )
  end

  def tab_controller
    UITabBarController.alloc.initWithNibName(nil, bundle: nil).tap do |tab|
      tab.viewControllers = [
        nav_controller, alphabet_controller, animation_controller
      ]
    end
  end

  # def other_controller
  #   UIViewController.alloc.initWithNibName(nil, bundle: nil).tap do |tap|
  #     tap.title = "Other"
  #     tap.view.backgroundColor = UIColor.purpleColor
  #   end
  # end

  def alphabet_controller
    AlphabetController.alloc.initWithNibName(nil, bundle: nil)
  end

  def animation_controller
    AnimationController.alloc.initWithNibName(nil, bundle: nil)
  end

  def setup_root
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'HelloMotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor
  end
end
