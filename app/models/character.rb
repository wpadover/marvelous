class Character < MarvelResource

  debug_output $stderr

  attr_accessor :id, :name, :description, :thumbnail, :comics, :stories, :events, :series

  def initialize(params)
    self.id = params['id']
    self.name = params['name']
    self.description = params['description']
    self.thumbnail = params['thumbnail']
    self.comics = params['comics']
    self.stories = params['stories']
    self.events = params['events']
    self.series = params['series']
  end

  def self.all(page_num = 0)
    limit = 20
    resp = self.get("/characters", query: req_params.merge({
      limit: limit, offset: page_num*limit, orderBy: 'name'
    }))
    if resp.success?
      resp['data']['results'].map do |result|
        Character.new(result)
      end
    else
      []
    end
  end

end
