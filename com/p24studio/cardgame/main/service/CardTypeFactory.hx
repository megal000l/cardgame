package com.p24studio.cardgame.main.service;

import com.p24studio.cardgame.main.domain.CardType;

class CardTypeFactory {
  public static function addCardType(db, name:String, attack:Int, healthPoints:Int) {
    var cardTypes = db.col(CardType);
    var newCardType = new CardType(name, attack, healthPoints); // TODO: test the correctness of the parameters
    cardTypes.push(newCardType);
    db.save();
  }

  public static function findAll(db):Array<CardType> {
    var cardTypes = db.col(CardType);
    return cardTypes;
  }
}
