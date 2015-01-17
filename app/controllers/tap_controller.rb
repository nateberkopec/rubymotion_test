# Tapping on stuff.
class TapController < UIViewController
  def viewDidLoad
    super

    view.backgroundColor = UIColor.whiteColor
    view.addSubview generate_label
    self.title = 'Tap'

    navigationItem.rightBarButtonItem = right_button
  end

  def push
    new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    navigationController.pushViewController(new_controller, animated: true)
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
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = 'RubyMotion, bitches'
    label.sizeToFit
    label.center = CGPointMake(
      view.frame.size.width / 2,
      view.frame.size.height / 2
    )
    label
  end
end
