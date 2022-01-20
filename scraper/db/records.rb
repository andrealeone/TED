
class TalkRecord < ActiveRecord::Base
  self.table_name = 'talks'
end

class SlugRecord < ActiveRecord::Base
  self.table_name = 'slugs'
end

ActiveRecord::Base.connection
