

import Foundation
import UIKit


class Game
{
	//============ THE CLASSES ============
	
	let viewcontroler = ViewController()
	let pokerHands = PokerHands()
	let metagame = MetaGame()
	let animation = Animation()
	
	//=====================================
	
	//------ Start the game fonction ------
	func initialize()
	{
		if viewcontroler.chances == 0
		{
			return
		}
		else
		{
			viewcontroler.chances = viewcontroler.chances - 1
		}
		
		var allSelected = true
		for backAnimation in viewcontroler.arrayBacks
		{
			if backAnimation.layer.borderWidth != 1.0
			{
				allSelected = false
				break
			}
		}
		
		if allSelected == true
		{
			randomCards()
			return
		}
		for backAnimation in viewcontroler.arrayBacks
		{
			if backAnimation.layer.borderWidth != 1.0
			{
				backAnimation.startAnimating()
			}
		}
		Timer.scheduledTimer(timeInterval: 2.4,
		                     target: self,
		                     selector: #selector(randomCards),
		                     userInfo: nil,
		                     repeats: false)
	}
	//--------------------------------------
	
	//------ The random cards to game ------
	@objc func randomCards()
	{
		viewcontroler.theHand = returnRandomHand()
		
		let tempHand = viewcontroler.theHand
		
		let arrayOfCards = createCards(tempHand: tempHand)
		
		displayCards(arrayOfCards: arrayOfCards)
		
		viewcontroler.permissionCards = true
		
		prepareForNextHand()
	}
	//--------------------------------------
	
	//------  ------
	func prepareForNextHand()
	{
		if viewcontroler.chances == 0
		{
			viewcontroler.permissionCards = false
			viewcontroler.dealButton.alpha = 0.5
			resetCards()
			viewcontroler.deck = metagame.createDeck()
			viewcontroler.handToAnalyse = [(0, ""), (0, ""), (0, ""), (0, ""), (0, "")]
			viewcontroler.chances = 2
			viewcontroler.bet = 0
			
		}
	}
	//--------------------------------------
	
	//------  ------
	func resetCards()
	{
		for index in 0...4
		{
			viewcontroler.arrayBacks[index].layer.borderWidth = 0.5
			viewcontroler.arrayBgs[index].layer.borderWidth = 0.0
			viewcontroler.arrayBgs[index].layer.backgroundColor = nil
			viewcontroler.arrayKeep[index].isHidden = true
		}
		viewcontroler.chances = 2
	}
	//--------------------------------------
	
	//------- Return the random hand -------
	func returnRandomHand() -> [(Int, String)] 			/* return the random hand to play */
	{
		var arrayToReturn = [(Int, String)]()
		
		for _ in 1...5
		{
			let randomIndex = Int(arc4random_uniform(UInt32(viewcontroler.deck.count)))
			
			arrayToReturn.append(viewcontroler.deck[randomIndex])
			viewcontroler.deck.remove(at: randomIndex)
		}
		return arrayToReturn
	}
	//--------------------------------------
	
	//------ Return the array to play ------
	func createCards(tempHand: [(Int, String)]) -> [String]
	{
		let card_1 = "\(tempHand[0].0)\(tempHand[0].1).png"
		let card_2 = "\(tempHand[1].0)\(tempHand[1].1).png"
		let card_3 = "\(tempHand[2].0)\(tempHand[2].1).png"
		let card_4 = "\(tempHand[3].0)\(tempHand[3].1).png"
		let card_5 = "\(tempHand[4].0)\(tempHand[4].1).png"
		return [card_1, card_2, card_3, card_4, card_5]
	}
	//--------------------------------------
	
	//------  ------
	func displayCards(arrayOfCards: [String])
	{
		var counter = 0
		for slotAnimation in viewcontroler.arraySlots
		{
			if slotAnimation.layer.borderWidth != 1
			{
				if viewcontroler.chances == 0
				{
					viewcontroler.handToAnalyse = removeEmptySlotsAndReturnArray()
					viewcontroler.handToAnalyse.append(viewcontroler.theHand[counter])
				}
			
				slotAnimation.image = UIImage(named: arrayOfCards[counter])
			}
			counter = counter + 1
		}
		
		Timer.scheduledTimer(timeInterval: 0.5,
		                     target: self,
		                     selector: #selector(turnCartes),
		                     userInfo: nil,
		                     repeats: false)
		
		if viewcontroler.chances == 0
		{
			let tempHand = viewcontroler.handToAnalyse
			verifyHand(hand: tempHand)
		}
	}
	
	@objc func turnCartes()
	{
		var counter = 0
		for flipAnimation in viewcontroler.arrayBgs
		{
			if flipAnimation.layer.borderWidth != 1
			{
				animation.showCard(from: viewcontroler.arrayBackViews[counter],
				                   to: viewcontroler.arrayFaceViews[counter])
			}
			counter = counter + 1
		}
	}
	//--------------------------------------
	
	//------  ------
	func removeEmptySlotsAndReturnArray() -> [(Int, String)]
	{
		var arrayToReturn = [(Int, String)]()
		
		for card in viewcontroler.handToAnalyse
		{
			if card != (0, "")
			{
				arrayToReturn.append(card)
			}
		}
		return arrayToReturn
	}
	//--------------------------------------
	
	//------  ------
	func verifyHand(hand: [(Int, String)])
	{
		if pokerHands.royalFlush(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.carmem_royal_flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.red.cgColor,
			                          repeating: 10)
			
			calculateHand(times: 250)
		}
		else if pokerHands.straightFlush(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.straight_flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 50)
		}
		else if pokerHands.fourKind(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.four_of_kind,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 25)
		}
		else if pokerHands.fullHouse(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.full_house,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 9)
		}
		else if pokerHands.flush(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 6)
		}
		else if pokerHands.straight(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.straight,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 4)
		}
		else if pokerHands.threeKind(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.three_of_kind,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 3)
		}
		else if pokerHands.twoPairs(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.two_pair,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 2)
		}
		else if pokerHands.onePair(hand: hand)
		{
			animation.animationLayers(label: viewcontroler.jacks_or_better,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 1)
		}
		else
		{
			calculateHand(times: 0)
		}
	}
	//--------------------------------------
	
	//------  ------
	func calculateHand(times: Int)
	{
		viewcontroler.credits += (times * viewcontroler.bet)
		viewcontroler.credits_label.text = "\(viewcontroler.credits)"
	}
	//--------------------------------------
	
}





























