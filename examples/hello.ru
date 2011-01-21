#\ -w -p 8765
app = lambda{|env| [200, {"Content-Type" => 'text/plain'}, 'Hello World']}
run app