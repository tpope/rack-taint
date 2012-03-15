# Rack::Taint

Rack::Taint is Rack middleware to taint the the query string (and thus
GET parameters), input (and thus POST parameters), headers (and thus
cookies), and everything else that comes in on a request.  Among other
use cases, this may prove helpful as a component in a [scheme that
limits mass assignment in Rails][mass assignment scheme].

[mass assignment scheme]: http://jkfill.com/2012/03/10/preventing-mass-assignment-injection-in-rails/

## Installation

Add this line to your application's Gemfile:

    gem 'rack-taint'

On Rails, the Railtie takes care of everything else.  On everything
else, you'll need to add the `Rack::Taint` middleware to the stack
yourself.

## Contributing

Please follow [Git commit message best practices][practices] when
submitting a pull request.

[practices]: http://stopwritingramblingcommitmessages.com/

If I provide you with feedback on your pull request, generally you should
squash your changes into the previous commit when submitting a second request.
