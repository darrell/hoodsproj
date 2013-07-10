configure do

  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgis',
    :host     => 'localhost',
    :database => 'nbohood',
    :encoding => 'utf8'
  )
end
