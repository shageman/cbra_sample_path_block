# Gemfile "path blocks" vs "path options"
Check out the two branches of this project to see how in a Gemfile `path 'YOUR_PATH' do` behaves differently than `gem 'X', path: 'YOUR_PATH/x'`

## The 2 Alternatives

In your `Gemfile` you can use the block:

        path "components" do
          gem "a"
        end

Or you can use the option:

        gem "a", path: "components/a"
        gem "b", path: "components/b"

With the option you need to specify your direct dependencies and all transitive dependencies that are local. With the block syntax you do not have to that!

## The 2 Results

For the following, be aware that `Azzer` is defined in `A` and `Buzzer` is defined in `B`.

The above variants behave slightly differently in one important way:


block:

~~~~~~~~
± |path_block ✗| → rails c
Loading development environment (Rails 4.1.9)
2.2.1 :001 > A
 => A
2.2.1 :002 > B
 => B
2.2.1 :003 > Azzer
 => Azzer
2.2.1 :004 > Buzzer
NameError: uninitialized constant Buzzer
	from (irb):4
	from /Users/stephan/.rvm/gems/ruby-2.2.1/gems/railties-4.1.9/lib/rails/commands/console.rb:90:in `start'
	from /Users/stephan/.rvm/gems/ruby-2.2.1/gems/railties-4.1.9/lib/rails/commands/console.rb:9:in `start'
	from /Users/stephan/.rvm/gems/ruby-2.2.1/gems/railties-4.1.9/lib/rails/commands/commands_tasks.rb:69:in `console'
	from /Users/stephan/.rvm/gems/ruby-2.2.1/gems/railties-4.1.9/lib/rails/commands/commands_tasks.rb:40:in `run_command!'
	from /Users/stephan/.rvm/gems/ruby-2.2.1/gems/railties-4.1.9/lib/rails/commands.rb:17:in `<top (required)>'
	from /Users/stephan/workspace/cbra/path_block_sample/bin/rails:8:in `<top (required)>'
	from /Users/stephan/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
	from /Users/stephan/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
	from -e:1:in `<main>'
~~~~~~~~

option:

~~~~~~~~
± |path_option ✗| → rails c
Loading development environment (Rails 4.1.9)
2.2.1 :001 > A
 => A
2.2.1 :002 > B
 => B
2.2.1 :003 > Azzer
 => Azzer
2.2.1 :004 > Buzzer
 => Buzzer
 ~~~~~~~~
 
 Anyone got any idea as to why this is?
