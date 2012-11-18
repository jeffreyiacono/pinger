## Pinger

Commandline utility that pings a url until a 200 response is achieved ...
or it gets tired and quits (where "gets tired" is defined as trying 20 times,
pausing 4 seconds in between each try).

## Usage

    $ ./pinger.sh [url]
    $ ./pinger    [url]

- If a `200` status is encountered, script exits 0 and prints a success message
- If a `301` status is encountered, script exits 1 and prints a notice to supply
  the new url
- Otherwise the script sleeps for 4 seconds and retries
  exit status of 1 and message of "failed" is returned if script is not able to
  get a 200 response from the supplied URL after 20 tries.

You can clone the repo into `~/src` and symlink to `~/bin` and use it anywhere:

    $ cd ~/src
    $ git clone https://github.com/jeffreyiacono/pinger.git
    $ cd ~/bin
    $ ln -s ~/src/pinger/pinger.sh pinger
    $ pinger -h
    # Usage: path/to/pinger [url]

Just make sure `~/bin` is in your `PATH`.

## Why?

Let's say you host a web-app on a cloud application platform (*cough* heroku
*cough*) and this service periodically unloads your app if there hasn't been any
visitors for a given period of time. As a result, a brave visitor will be
greeted with a terrifying `500` error page, which is no good. So how do we solve
this? Use `pinger` + `cron` to ensure your app is periodically reloaded.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2012 Jeff Iacono

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
