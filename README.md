# ServeThis

An escript that serves the current directory over HTTP.

I didn't want to have to use `python -m SimpleHTTPServer` anymore so I made
this. It's basically exactly the same thing, except ~10 times faster, and it
supports etag caching. Great for previewing what your generated ExDoc looks like
for your project by running it in `/doc`.

Should definitely work on Linux and Mac OS X, but untested on Windows. Let me
know if it works for you!

## Installation

If you have Elixir 1.4 or above,

`mix escript.install hex serve_this`

If you have Elixir 1.3 or above,

`mix escript.install https://raw.githubusercontent.com/antipax/serve_this/master/serve_this`

If you don't trust me, you can also clone this repository, read the code, and
then run this yourself:

`MIX_ENV=prod mix escript.build, escript.install`

Otherwise, download or build the `serve_this` escript and place it
somewhere in your path.

## Usage

After installation, simply run `serve_this` to serve the current directory on
port 8000.

You can use the `PORT` environment variable to alter the server port
from the default, which is 8000.

If you access a directory, you will receive a listing, unless a file named
`index.html` is present, in which case it will be served instead.
