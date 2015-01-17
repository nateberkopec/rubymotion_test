# Tapping on stuff.
class TapController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    view.addSubview generate_label
    self.title = "Tap (#{navigationController.viewControllers.count})"

    navigationItem.rightBarButtonItem = right_button
  end

  def push
    new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    navigationController.pushViewController(new_controller, animated: true)
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = tab_bar_item
    self
  end

  private

  def right_button
    UIBarButtonItem.alloc.initWithTitle(
      'Push',
      style: UIBarButtonItemStyleBordered,
      target:self,
      action:'push'
    )
  end

  def generate_label
    UILabel.alloc.initWithFrame(CGRectZero).tap do |label|
      label.text = 'Fuck Swift, use RubyMotion'
      label.sizeToFit
      label.center = CGPointMake(
        view.frame.size.width / 2,
        view.frame.size.height / 2
      )
    end
  end

  def tab_bar_item
    UITabBarItem.alloc.initWithTabBarSystemItem(
      UITabBarSystemItemFavorites,
      tag: 1
    )
  end
end
