### storable - simple json-to-file storable objects

    c) 2013 Sebastian Glaser

    Version: 0.0.1
    License: GNU GPL Version 3

  This file is part of storable.

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
  
  http://www.gnu.org/licenses/gpl.html ###

module.exports = class Storable
  constructor : (@path, opts={}) -> { @defaults, override } = opts; null
  read : (callback) =>
    _read = (inp) => try
      inp = {} unless inp?
      if @defaults?
        inp[k] = v for k,v of @defaults when not inp[k]?
        inp[k] = v for k,v of @defaults when typeof v is 'Number' and typeof inp[k] isnt 'Number'
      if override?
        inp[k] = v for k,v of override  when override[k]?
      @[k] = v for k,v of inp
      callback inp if callback?
    fs.readFile @path, (err, data) =>
      log 'error', err if err
      try _read JSON.parse data.toString('utf8')
      catch e
        log 'error', e; _read {}; @save()
    null
  override : (opts={}) =>
    change = no
    for k, v of opts
      change = yes
      @[k] = v
    try @save() if change
    null
  save : (callback) =>
    out = {}
    out[k] = v for k,v of @ when typeof v isnt 'function' and k isnt 'path' and k isnt 'defaults'
    try fs.writeFile @path, JSON.stringify(out), callback
    null