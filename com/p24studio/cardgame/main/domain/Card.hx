package com.p24studio.cardgame.main.domain;

class Card {
    var state:CardState;
    var type:CardType;
    var healthPoints:Int;
    
    public function new(type:CardType) {
        state = CardState.ALIVE;
        this.type = type;
        healthPoints = type.get_healthPoints();
    }

    public function toString() {
        return 'Card(name:${type.get_name()}, state:$state, healthPoints:$healthPoints)';
    }
}