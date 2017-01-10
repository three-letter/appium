
describe 'Dg Web In Appium' do
  describe 'Index View' do
    before(:each) do
      @driver.navigate.to 'http://localhost:3000'
    end

    it 'should be have two button' do
      wait{
        btns = @driver.find_elements(:class, "btn-dg-info")
        expect(btns.size).to eq(2)
      }
    end

    it 'should display btn in bottom when swipe down' do
      wait{
        @driver.execute_script("window.scrollBy(0, window.innerHeight);")
        btns = @driver.find_elements(:class, "goinvest")
        btn = btns[0]
        expect(btn.displayed?).to be true
      }
    end

  end

  describe 'Qa View' do
    before(:each) do
      @driver.navigate.to 'http://localhost:3000/invest/qa'
    end

    it 'should show 18 items' do
      wait{
        items = @driver.find_elements(:class, "panel_list_item")
        expect(items.size).to eq(18)
      }
    end

  end

  describe 'Login View' do
    before(:each) do
      wait{ @driver.navigate.to 'http://localhost:3000/logout'}
      wait{ @driver.navigate.to 'http://localhost:3000/login'}
    end

    it 'should redirect to my assets when success' do
      phone = @driver.find_elements(:name, "account[phoneHome]")[0]
      passwd = @driver.find_elements(:name, "account[password]")[0]
      submit = @driver.find_elements(:name, "commit")[0]

      phone.type "18621383221"
      passwd.type "1234qwer"
      submit.click

      wait{
        asset_title = @driver.find_elements(:class, "nav_bar_title")[0]
        expect(asset_title.text).to eq("我的资产")
      }
    end

    it 'should redirect to login when fail' do
      phone = @driver.find_elements(:name, "account[phoneHome]")[0]
      passwd = @driver.find_elements(:name, "account[password]")[0]
      submit = @driver.find_elements(:name, "commit")[0]

      phone.type "18621383221"
      passwd.type "1234"
      submit.click

      wait{
        pop_content = @driver.find_elements(:class, "pop_hint_content")[0]
        expect(pop_content.text).to eq("手机号或密码错误")
      }
    end

  end

end
