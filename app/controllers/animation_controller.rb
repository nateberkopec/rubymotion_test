# List the alphabet in a table
class AnimationController < UIViewController
  def viewDidLoad
    super

    self.title = 'Animation'

    @points        = window_bounds
    @current_index = 0

    @view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @view.backgroundColor = UIColor.whiteColor
    view.addSubview(@view)

    animate_to_next_point
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = tab_bar_item
    self
  end

  def animate_to_next_point
    @current_index += 1
    @current_index = @current_index % @points.count

    UIView.animateWithDuration(
      1,
      animations: lambda do
        @view.frame = [@points[@current_index], [100, 100]]
      end,
      completion: lambda do |finished|
        animate_to_next_point
      end
    )
  end

  private

  def tab_bar_item
    UITabBarItem.alloc.initWithTabBarSystemItem(
      UITabBarSystemItemTopRated,
      tag: 1
    )
  end

  def window_bounds
    [
      [0, 0],
      [view.size.width - 100, 0],
      [0, view.size.height - 100],
      [view.size.width - 100, view.size.height - 100]
    ]
  end
end
