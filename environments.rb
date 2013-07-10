configure do

  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :host     => 'localhost',
    :database => 'nbohood',
    :encoding => 'utf8'
  )
end
