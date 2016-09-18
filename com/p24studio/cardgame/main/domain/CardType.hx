package com.p24studio.cardgame.main.domain;

class CardType {
    var name(get,null):String;
    var healthPoints(get,null):Int;
    var attack:Int;

    public function new(name:String, attack:Int, healthPoints:Int) {
        this.name = name;
        this.attack = attack;
        this.healthPoints = healthPoints;
    }

    public function get_name() {
        return name;
    }

    public function get_healthPoints() {
        return healthPoints;
    }

    public function toString() {
        return '$name ($attack / $healthPoints)';
    }
}
