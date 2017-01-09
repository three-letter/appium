
describe 'Dg Web In Appium' do
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


end
