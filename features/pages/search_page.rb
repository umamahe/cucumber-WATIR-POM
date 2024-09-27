require 'page-object'
class SearchPage
  include PageObject
 
  text_field(:search_box, id: "twotabsearchtextbox")
  button(:search, value: "Go")
  div(:search_results, id: "search")
 
  def visit_amazon_site
    @browser.goto 'http://www.amazon.com'
  end
 
  def enter_search_keyword(search_key)
    self.search_box = search_key
  end
 
  def click_search_button
    search
  end
 
  def search_results_present?(search_key)
    search_results.include?(search_key)
  end
 
  def close
    @browser.close
  end
end