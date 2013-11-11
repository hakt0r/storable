## storable - simple json-to-file storable objects

### Installation
    $ npm install storable
    $ sudo npm install -g storable
    $ sudo npm install -g git://github.com/hakt0r/storable.git

### Node.JS Usage:
    var Storable = require('storable');
    var Prefs = new Storable( '/tmp/test.json', {
      defaults : { key1 : 1, key2 : 2, key3 : 3 },
      override : { key3 : process.argv[4] }
    })
    Prefs.save()
    Prefs.key2 = 999
    Prefs.read()
    console.log(Prefs.key1, Prefs.key2, Prefs.key3)

### Equivalent CoffeeScript:

    Storable = require("storable")
    Prefs = new Storable "/tmp/test.json",
      defaults:
        key1: 1
        key2: 2
        key3: 3
      override:
        key3: process.argv[4]

    Prefs.save()
    Prefs.key2 = 999
    Prefs.read()
    console.log Prefs.key1, Prefs.key2, Prefs.key3

### Copyrights
  * c) 2013 Sebastian Glaser <anx@ulzq.de>

### Licensed under GNU GPLv3

storable is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

storable is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this software; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
Boston, MA 02111-1307 USA

http://www.gnu.org/licenses/gpl.html