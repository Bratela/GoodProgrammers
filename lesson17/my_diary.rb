puts "Привет я твой дневник!"
puts "Я сохраню всё что ты напишешь"

current_path = File.dirname(__FILE__)

line = nil
all_lines =[]

while line != "end" do
  line = STDIN.gets.encode("UTF-8").chomp
  all_lines << line
end

time =  Time.now
file_name = time.strftime("%Y-%m-%d")# 2015-10-21
time_string = time.strftime("%H:%M")#07:16

separator = "-----------------------------------------"

file = File.new(current_path + "/" + file_name +".txt", "a:UTF-8")
file.print("\n\r" + time_string + "\n\r")
all_lines.pop

for item in all_lines do
  file.puts(item)
end

file.puts(separator)

file.close

puts "Ваша запись сохранена в файл #{file_name}.txt"


