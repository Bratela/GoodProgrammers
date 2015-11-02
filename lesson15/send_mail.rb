require "pony"
require "io/console"

my_mail ="hereyoursmailadress@ya.ru"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password =STDIN.noecho(&:gets).chomp
puts "Кому отправить письмо ?"
send_to =STDIN.gets.chomp

puts "Что написать в письме?"
body =STDIN.gets.chomp

Pony.mail(
    {
        :subject => "Привет из Ruby",
        :body => body,
        :to => send_to,
        :from => my_mail,

        :via => :smtp,
        :via_options => {
            :address        => 'smtp.yandex.ru',
            :port           => '465',
            :tls            => true ,
            :user_name      => my_mail,
            :password       => password,
            :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
            #:domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
        }


          }
)
puts "Письмо успешно отправлено!"
