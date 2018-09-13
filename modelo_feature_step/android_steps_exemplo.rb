
require 'calabash-android/calabash_steps'

Then /^I buy "([^\"]*)" (\d+) times (\d+) buy$/ do |btid, cnt, cnt1|
  bts = query("textview").find_all{|x| x["id"] == btid}
  bts = query("textview").find_all{|x| x["text"].include?("$")}
  
  qry = "textview id:'"+  btid + "'"
  
  for j in 0..cnt1.to_i-1 do      hasDrawer = false;
      if query("button text:'Promotion'").size <= 0 then
          wait_for_elements_exist( ["button text:'Softkey'"], :timeout => 6)
          performAction('press_button_with_text',"Softkey")
          wait_for_elements_exist( ["* marked:'Promotion'"], :timeout => 6)
          hasDrawer = true
      end
      mod = (j % 3)
      if mod == 0 then
          performAction('press_button_with_text',"Product")
          wait_for_elements_exist( ["button text:'OK'"], :timeout => 6)
          performAction('click_on_text',"SO WINE")
          performAction('wait', 1)
          checks = query("checkbox")
          performAction('toggle_numbered_checkbox', rand(checks.size))
          performAction('press_button_with_text', "OK")
      elsif mod == 1 then
        performAction('scroll_down')
      elsif mod == 2 then
        performAction('scroll_up')
      end
      performAction('wait', 1)
      bts = query(qry)
      puts(bts.size)
      for i in 0..cnt.to_i-1 do
          rd = rand(bts.size);
          txt = bts[rd]["text"]
          puts("click - " + txt)
          if txt.include?("$") then
          else
              performAction('click_on_text',txt)
              performAction('wait', 1)
              if query("button text:'OK'").size > 0 then
                  if query("button text:'Void Line'").size > 0 then
                      performAction('press_button_with_text', "+")
                  end
                  performAction('press_button_with_text', "OK")
              end
          end
      end
      if hasDrawer then
          performAction('press_button_with_text',"Softkey")
          wait_for_elements_exist( ["button text:'Check Out'"], :timeout => 6)
      end
      performAction('click_on_text',"Check Out")
      wait_for_elements_exist( ["* marked:'Split Payment'"], :timeout => 6)
      performAction('click_on_text',"Split Payment")
      wait_for_elements_exist( ["button text:'OK'"], :timeout => 6)
      performAction('click_on_text',"OK")
      wait_for_elements_exist( ["* marked:'Exact Change'"], :timeout => 6)
      if mod == 0 then
          performAction('click_on_text',"Next Dollar")
      else
          performAction('click_on_text',"Exact Change")
      end
      performAction('click_on_text',"OK")

  end
  
end

Then /^I random press "([^\"]*)"$/ do |btid|
    qid = "textview id:'"+  btid + "'"
	puts("query - " + qid)
    bts = query(qid)
    puts(bts.size)
    rd = rand(bts.size);
	txt = bts[rd]["text"]
    performAction('click_on_text',txt)
end

Then /^I Login$/ do
    performAction('click_on_text',"1")
    performAction('click_on_text',"2")
    performAction('click_on_text',"3")
    performAction('click_on_text',"4")
    performAction('wait', 1)
    
    rd = 4
    if query("* marked:'Select Cash Register'").size > 0 then
        rd = rand(4) + 1;
        performAction('press_list_item', rd, 0)
    elsif query("button text:'OK'").size > 0 then
        performAction('press_button_with_text', "OK")
    end
    
    if (rd != 4) then
        wait_for_elements_exist( ["* marked:'Check Out'"], :timeout => 6)
        result = performAction( 'get_list_item_text', '1' )
        if result.size>0 then
            qry = "textview id:'Product'"
            bts = query(qry)
            for i in 0..4.to_i-1 do
                rid = rand(bts.size);
                rdata = rand(9) + 1;
                txt = bts[rid]["text"]
                txt.sub! '$', ''
                performAction('click_on_text',txt)
                performAction('wait', 1)
                wait_for_elements_exist( ["button text:'OK'"], :timeout => 6)
                performAction('click_on_text',rdata)
                performAction('click_on_text',"OK")
            end
            performAction('click_on_text',"Check Out")
            wait_for_elements_exist( ["button text:'OK'"], :timeout => 6)
            performAction('click_on_text',"OK")
        end
    end
end
