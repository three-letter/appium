
describe 'Qa View' do
  before(:each) do
    @driver.navigate.to 'http://localhost:3000/invest/qa'
    @screenshot_id = rand(1000000)   
  end

  it 'should show 18 items' do
    items = @driver.find_elements(:class, "panel_list_item")
    @driver.save_screenshot("/Users/andy/Work/appium/images/iv_#{@screenshot_id}.png")
    expect(items.size).to eq(18)
  end

end
