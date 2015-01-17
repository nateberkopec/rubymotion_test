# List the alphabet in a table
class AlphabetController < UIViewController
  def viewDidLoad
    super

    self.title = 'Alphabet'

    @table = UITableView.alloc.initWithFrame(view.bounds)
    view.addSubview @table
    @table.dataSource = self
    @table.delegate = self

    @data = ('A'..'Z').to_a
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = tab_bar_item
    self
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= 'CELL_IDENTIFIER'

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) ||
           default_table_view_cell
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    UIAlertView.alloc.init.tap do |alert|
      alert.message = "#{@data[indexPath.row]} tapped!"
      alert.addButtonWithTitle 'SWEET!'
      alert.show
    end
  end

  private

  def tab_bar_item
    UITabBarItem.alloc.initWithTabBarSystemItem(
      UITabBarSystemItemFeatured,
      tag: 1
    )
  end

  def default_table_view_cell
    UITableViewCell.alloc.initWithStyle(
      UITableViewCellStyleDefault,
      reuseIdentifier:@reuseIdentifier
    )
  end
end
