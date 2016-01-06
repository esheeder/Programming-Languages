=begin
	Demo: Method invocation
	Corresponds to: RubyExpressions.ppt
=end

def test
$i = 100
	while $i > 90
		yield $i, $i % 15
		$i -=1
	end
end

test {|i,j| puts "#{i} modulo 15 is #{j}"}