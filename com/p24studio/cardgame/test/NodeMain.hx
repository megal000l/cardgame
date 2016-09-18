// Install : git, node, haxe
// haxelib install hxnodejs
// haxelib install haxelow
// haxelib git js-kit https://github.com/clemos/haxe-js-kit.git haxelib
// npm install

// At the root: haxe -lib hxnodejs -lib js-kit -lib haxelow -main com.p24studio.cardgame.test.NodeMain -js server.js -D js-es5
package com.p24studio.cardgame.test;

import js.Node;
import js.node.Http;
import js.node.Path;
import js.npm.Express;
import js.npm.express.*;
import js.Node.console;

import com.p24studio.cardgame.main.domain.*;
import com.p24studio.cardgame.main.service.*;

import com.p24studio.cardgame.main.constants.Rules;

class NodeMain {
    private var PORT = 1337;

    function new()
    {
        var app    = new js.npm.Express();
        var server = js.node.Http.createServer( cast app );
        var io     = new js.npm.socketio.Server(server); // sockets
        var db = new HaxeLow('db.json'); // Database

        //demoDatabase(db);


        /** ROUTING */
        app.get('/', function (req, res) {
          res.sendfile(Node.__dirname + '/public/index.html');
        });

        /** SOCKETS */
        io.on('connection', function (socket) {
            socket.emit('message', { message: 'welcome to the chat' });
            socket.on('send', function (data) {
                io.sockets.emit('message', data);
            });
        });
        trace("Listening on port " + PORT);
        server.listen(PORT);
    }

    static public function main()
    {
        var main = new NodeMain();
    }

    static function demoDatabase(db) {
      /** TEST DATABASE */
      //CardTypeFactory.addCardType(db, "Knight", 1, 1);
      var cardTypes = CardTypeFactory.findAll(db);
      for(ct in cardTypes) {
        trace('$ct');
      }
    }
}
