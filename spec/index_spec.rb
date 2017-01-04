
describe 'Index View' do
  before(:each) do
    @driver.navigate.to 'http://localhost:3000'
    @screenshot_id = rand(1000000)   
  end

  it 'should be have two button' do
    wait{
      btns = @driver.find_elements(:class, "btn-dg-info")
      @driver.save_screenshot("/Users/andy/Work/appium/images/iv_#{@screenshot_id}.png")
      expect(btns.size).to eq(2)
    }
  end

  it 'should display btn in bottom when swipe down' do
    @driver.execute_script("window.scrollBy(0, window.innerHeight);")
    @driver.save_screenshot("/Users/andy/Work/appium/images/iv_#{@screenshot_id}.png")
    btns = @driver.find_elements(:class, "goinvest")
    btn = btns[0]
    expect(btn.displayed?).to be true
  end

end



