def explode
  raise "bam!" if rand(10) == 0
end

def catch
  begin
    10.times do 
	  explode
	  puts "tick"
	end
  rescue RuntimeError => e
    exit
  ensure
    puts "boom"
  end
end

catch