class Worker
  attr_accessor :workers
  def initialize
    @workers = Hash.new #contains info about all the workers
  end
  def worker_add_info(name, salary)
    @workers[name] = salary
  end
  def worker_info
    @workers
  end
end

workers = Worker.new
File.open("workers.txt").each do |line|
  name, salary = line.split(":")
  workers.worker_add_info(name,salary.to_f)
end
loop do
  puts """Type the command of what you want to do:
  - worker - to start inputing the name and salary on a worker
  - premium - to get an info about the premium of a worker
  - exit - to stop the programm
  - file - to export all data about workers to file
  Each command has to be printed with no '-' sign"""
  answer = gets.chomp
  case answer
    when "worker"
      puts "Type worker's name:"
      name = gets.chomp
      puts "Type worker's salary($USD):"
      salary = gets.chomp
      workers.worker_add_info(name, salary.to_f)
      puts workers.worker_info
    when "premium"
      puts "Type worker's name:"
      extra_name = gets.chomp#name of worker
      puts "Workers salary with premium this month:",  workers.worker_info[extra_name]*1.1
    when "exit"
      break
    when "file"
      File.open("workers_new.txt",'w') do |line|
        workers.workers.each do |elem|
          line.puts "\r" + elem[0] + ": " + elem[1].to_s
        end
      end
      puts "Exported to file 'workers_new.txt'"
    else
      puts "Unknown command!"
    end
end
