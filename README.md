# ElectricSheep

Allows you to use ruby to construct a very basic TADs story file.

## Installation

Add this line to your application's Gemfile:

    gem 'electric_sheep'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install electric_sheep

## Usage

	require 'electric_sheep'

	game = ElectricSheep::Game.new(
		:name => 'Blade Runner', :byline => 'by Philip K. Dick',
		:desc => 'Dystopian future where replicants walk amoungst us',
		:version => '1',
		:authorEmail => 'Bob <bob@example.com>'
	)

	first_room = ElectricSheep::Room.new('Starting Room')
	first_room.desc = %q{This is the boring starting rooms.}

	me = ElectricSheep::Actor.new('me')
	me.location = first_room

	game.initialPlayerChar = me

	game.rooms << first_room
	game.actors << me

	puts game.build_tads

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
