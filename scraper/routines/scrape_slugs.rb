
def start_loop_of n
  n.times { |i| TED_Scraper::Slug.from_page i }
end

start_loop_of 5
