# Haxe externs for jQuery 1.x #

Also, this project contains externs for jQuery plugins.
Third-party plugins are embed related js (no need manual code to load *.js).

### Externs for the official jQuery UI ###

 * Core
 * Draggable
 * Droppable
 * Mouse
 * Position
 * Resizable
 * Sortable
 * Widget

### Externs for third-party plugins ###

 * AnimateColors - http://www.bitstorm.org/jquery/color-animation/
 * Autocomplete - https://github.com/devbridge/jQuery-Autocomplete
 * AutoResize - textarea auto resizer
 * DamnUploader - massive files uploader (https://github.com/safronizator/damnUploader)
 * FormValidating - simple form validating helper
 * ImgCenter - https://github.com/drewwilson/ImgCenter
 * ImgLiquid - https://github.com/karacas/imgLiquid
 * ImgPreload - https://github.com/farinspace/jquery.imgpreload
 * Jeditable - http://www.appelsiini.net/projects/jeditable
 * Layout - great for web app (http://layout.jquery-dev.com/)
 * MouseWheel - https://github.com/jquery/jquery-mousewheel
 * NumberFormat - https://github.com/customd/jquery-number
 * ScrollPane - http://jscrollpane.kelvinluck.com/
 * Selection - http://madapaja.github.io/jquery.selection/
 * Spectrum - great color selector (https://bgrins.github.io/spectrum/)
 * TouchEvents - https://github.com/hammerjs/hammer.js


### Using ###

You must add <script> to load jQuery library to your HTML before haxe code.
In haxe just `import js.JQuery` and use JQuery object.
See `test` in repo for plugin using example.
