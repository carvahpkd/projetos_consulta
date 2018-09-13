# posts.rb
require_relative '../helpers'

namespace '/api' do
  before do
    content_type 'application/json'
    headers 'Access-Control-Allow-Origin' => '*'
  end

  helpers do
    def get_post
      @post ||= Post.where(id: params[:id]).first
    end

    def halt_if_post_not_found!
      halt(404, { message: 'Post Not Found' }.to_json) unless get_post
    end

    def seri_post(post)
      PostSerializer.new(post).to_json
    end
  end

  get '/posts' do
    posts = Post.all

    %i[title body].each do |filter|
      posts = posts.send(filter, params[filter]) if params[filter]
    end

    posts.map { |post| PostSerializer.new(post) }.to_json
  end

  get '/posts/:id' do |_id|
    halt_if_post_not_found!
    seri_post(get_post)
  end

  post '/posts' do
    post = Post.new(json_params)
    t = Time.now
    post[:created_date] = t.strftime('%m/%d/%Y')
    halt 422, seri_post(post) unless post.save
    response.headers['_id'] = post.id.to_s
    status 200
  end

  put '/posts/:id' do
    halt_if_post_not_found!
    halt 422, seri_post(get_post) unless get_post.update_attributes(json_params)
    seri_post(get_post)
  end

  delete '/posts/:id' do
    halt_if_post_not_found!
    get_post.destroy if get_post
    status 200
  end
end
