package com.p24studio.cardgame.main.constants;
import sys.io.File;
import haxe.Json;

class Rules {
    public static var maxCardsHand:Int;
    public static var playerDefaultLife:Int;

    public static function loadRules(configFilePath:String) {
        var rulesString = File.getContent(configFilePath); // TODO: catch file not found exception
        var rules = Json.parse(rulesString);

        isRulesObjectValid(rules); // TODO: catch invalid rules exception
        maxCardsHand = rules.maxCardsHand;
        playerDefaultLife = rules.playerDefaultLife;
    }

    static function isRulesObjectValid(rules:Dynamic) { // TODO: throw invalid rules exception
        if (rules.maxCardsHand == null || rules.playerDefaultLife == null) {
            // TODO: throw invalid rules exception
            trace("Invalid rules");
        }
    }
}