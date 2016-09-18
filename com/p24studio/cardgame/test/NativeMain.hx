// At the root: haxe -main com.p24studio.cardgame.test.NativeMain --interp
package com.p24studio.cardgame.test;

import com.p24studio.cardgame.main.domain.*;
import com.p24studio.cardgame.main.constants.Rules;

class NativeMain {
	static public function main():Void {
		trace("Starting game"+"\n");

		trace("Rules initialization");
		Rules.loadRules("config.json");

		trace("Player Info initialization");
		var player1 = new Player("Fox", Rules.playerDefaultLife);
		trace(player1+"\n");
		trace("Loading database");
		var gobelin = new CardType("Gobelin", 1, 1);
		trace(gobelin+"\n");

		trace("Deck initialization");
		var card1 = new Card(gobelin);
		trace(card1);
		
		player1.get_deck().add(card1);
		trace(player1+"\n");

		trace("Player 1 draws");
		player1.draw();
		trace(player1+"\n");

		trace("End of game");

	}
}
