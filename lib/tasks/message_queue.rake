namespace :message_queue do
  task :process => :environment do
    Signal.trap("INT")  { EM.stop }
    Signal.trap("TERM") { EM.stop }

    EventMachine.run do
      connection = AMQP.connect(:host => '127.0.0.1')
      puts "Connecting to AMQP broker. Running #{AMQP::VERSION} version of the gem..."

      channel  = AMQP::Channel.new(connection)
      exchange = channel.default_exchange
      queue    = channel.queue("amqp.conf_messages.participants.leave", :auto_delete => true)


      queue.subscribe do |payload|
        PrivatePub.publish_to("/messages/new", "alert('Participant #{payload} leaving');participants.get(#{payload}).destroy();")
      end

    end
  end
end
