//  Ultra Carmen Poker
//
//  Created by Marcos Gomes on 17-10-19.
//  Copyright © 2017 Loto Québec. All rights reserved.
//

import UIKit

class ViewController: UIViewController

{
	//============ THE OUTLETS ============
	
	//------------ cards slots ------------
	
	@IBOutlet weak var slot_1: UIImageView!
	@IBOutlet weak var slot_2: UIImageView!
	@IBOutlet weak var slot_3: UIImageView!
	@IBOutlet weak var slot_4: UIImageView!
	@IBOutlet weak var slot_5: UIImageView!
	//-------------------------------------
	
	//------------ cards slots ------------
	@IBOutlet weak var back_image_1: UIImageView!
	@IBOutlet weak var back_image_2: UIImageView!
	@IBOutlet weak var back_image_3: UIImageView!
	@IBOutlet weak var back_image_4: UIImageView!
	@IBOutlet weak var back_image_5: UIImageView!
	//-------------------------------------
	
	
	//--------- cards backgrounds ---------
	@IBOutlet weak var bg_1: UIView!
	@IBOutlet weak var bg_2: UIView!
	@IBOutlet weak var bg_3: UIView!
	@IBOutlet weak var bg_4: UIView!
	@IBOutlet weak var bg_5: UIView!
	//-------------------------------------
	
	//--------- cards face views ----------
	@IBOutlet weak var face_view_1: UIView!
	@IBOutlet weak var face_view_2: UIView!
	@IBOutlet weak var face_view_3: UIView!
	@IBOutlet weak var face_view_4: UIView!
	@IBOutlet weak var face_view_5: UIView!
	//-------------------------------------
	
	//--------- cards back views ----------
	@IBOutlet weak var back_view_1: UIView!
	@IBOutlet weak var back_view_2: UIView!
	@IBOutlet weak var back_view_3: UIView!
	@IBOutlet weak var back_view_4: UIView!
	@IBOutlet weak var back_view_5: UIView!
	//-------------------------------------
	
	//------------ cards labels -----------
	@IBOutlet weak var keep_1: UILabel!
	@IBOutlet weak var keep_2: UILabel!
	@IBOutlet weak var keep_3: UILabel!
	@IBOutlet weak var keep_4: UILabel!
	@IBOutlet weak var keep_5: UILabel!
	//-------------------------------------
	
	//----------- Score Labels ------------
	@IBOutlet weak var carmem_royal_flush: UILabel!
	@IBOutlet weak var straight_flush: UILabel!
	@IBOutlet weak var four_of_kind: UILabel!
	@IBOutlet weak var full_house: UILabel!
	@IBOutlet weak var flush: UILabel!
	@IBOutlet weak var straight: UILabel!
	@IBOutlet weak var three_of_kind: UILabel!
	@IBOutlet weak var two_pair: UILabel!
	@IBOutlet weak var jacks_or_better: UILabel!
	//-------------------------------------
	
	@IBOutlet weak var credits_label: UILabel!
	
	@IBOutlet weak var dealButton: UIButton!
	
	//=====================================
	
	//=========== THE VARIABLES ===========
	
	var arrayBacksAnimation: [UIImage]!	 /* array of back cards to animation */
	
	var arrayBacks = [UIImageView]()		 /* array of cards back to animation */
	var arraySlots = [UIImageView]() 		 /* array of game slots to place the cards */
	
	var arrayKeep: [UILabel]!				 /* array of the labels keep to show "GARDER" */
	
	var arrayBgs: [UIView]!					 /* array of the place cards */
	var arrayFaceViews: [UIView]!			 /* array of the face views to flip and reflip */
	var arrayBackViews: [UIView]!			 /* array of the back views to flip and reflip */
	
	var deck = [(Int, String)]()			 /* touple to set all playing cards*/
	var arrayToFill = [(Int, String)]()		 /* touple to fill theHand touple with random cards*/
	var theHand = [(Int, String)]()		 	 /* Touple to do the hand to play */
	var handToAnalyse = [(Int, String)]()	 /* Hand to analize the final hand */
	
	
	
	
	var permissionToSelectCards = false
	var bet = 0
	var credits = 2000
	var chances = 2
	

	//============ THE DIDLOAD ============
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		//------------ THE CLASSES ------------
		let metagame = MetaGame()				/* Call the class MetaGame() */
		let style = Style()						/* Call the class Style() */
		let animation = Animation()				/* Call the class Animation() */
		
		//-------------------------------------
		
		//---- To create the arrays cards -----
		
		arrayBacksAnimation = metagame.backsFilesToArray()		/* array of UIImage */
		deck = metagame.createDeck()							/* array of playing cards */
		fillArrays()											/* fill others arrays */
		//-------------------------------------
		
		//--- Set backs on the image views ----
		
		metagame.setUIImageToUIImageViews(arrayOfImageViews: arrayBacks, uiImage: #imageLiteral(resourceName: "back.png"))
		
		//-------------------------------------
		
		//----- Stylized the backgrounds ------
		style.styleViews(arrayViews: arrayBgs,
		                 radius: 10,
		                 borderWidth: nil,						/* Its used to keep the cards */
		                 borderColor: UIColor.black.cgColor,
		                 bgColor: nil)
		//-------------------------------------
		
		//---- Stylized the face and back -----
		style.styleViews(arrayViews: arrayFaceViews,
		                 radius: 10,
		                 borderWidth: 0.5,
		                 borderColor: UIColor.black.cgColor,
		                 bgColor: nil)
		
		style.styleViews(arrayViews: arrayBackViews,
		                 radius: 10,
		                 borderWidth: 0.5,
		                 borderColor: UIColor.black.cgColor,
		                 bgColor: nil)
		//-------------------------------------
		
		//-- Stylized slots and image backs ---
		style.styleImageViews(arrayImageViews: arraySlots,
		                      radius: 10,
		                      borderWidth: 0.5,
		                      borderColor: UIColor.black.cgColor,
		                      bgColor: nil)
		
		style.styleImageViews(arrayImageViews: arrayBacks,
		                      radius: 10,
		                      borderWidth: 0.5,
		                      borderColor: UIColor.black.cgColor,
		                      bgColor: nil)
		
		//-------------------------------------
		
		//--------Prepered Animations ---------
		
		animation.animationSequentialCards(cards: arrayBacks,
		                                   duration: 0.3,
		                                   repeating: 8,
		                                   seqCards: arrayBacksAnimation)
		
		
		//-------------------------------------
		
	
	}
	//=====================================
	
	//---- To create the others arrays ----		/* I tryed to place in metagame, but I failed */
	func fillArrays()
	{
		arraySlots = [slot_1, slot_2, slot_3, slot_4, slot_5]
		arrayBacks = [back_image_1, back_image_2, back_image_3, back_image_4, back_image_5]
		
		arrayKeep = [keep_1, keep_2, keep_3, keep_4, keep_5]
		
		arrayBgs = [bg_1, bg_2, bg_3, bg_4, bg_5]
		arrayFaceViews = [face_view_1, face_view_2, face_view_3, face_view_4, face_view_5]
		arrayBackViews = [back_view_1, back_view_2, back_view_3, back_view_4, back_view_5]
		
		handToAnalyse = [(0, ""), (0, ""), (0, ""), (0, ""), (0, "")]
	}
	//-------------------------------------

	//============ THE BUTTONS ============
	
	//-------- To keep the cards ----------
	@IBAction func keep_cards(_ sender: UIButton)
	{
		if arrayBgs[sender.tag].layer.borderWidth == 0.5				/* if the card was choiced its will be desselect */
		{
			arraySlots[sender.tag].layer.borderWidth = 0.5
			arrayBgs[sender.tag].layer.borderWidth = 0.0
			arrayBgs[sender.tag].layer.backgroundColor = nil			/* This part hidden the cards */
			arrayKeep[sender.tag].layer.isHidden = true
		}
		else
		{
			arraySlots[sender.tag].layer.borderWidth = 1.0				/* This part show the cards */
			arrayBgs[sender.tag].layer.borderWidth = 0.5
			arrayBgs[sender.tag].layer.borderColor = UIColor.black.cgColor
			arrayBgs[sender.tag].layer.backgroundColor = UIColor(red: 0.83, green: 0.75, blue: 0.18, alpha: 0.5).cgColor
			arrayKeep[sender.tag].layer.isHidden = false
		}
	}
	//-------------------------------------
	
	//------------ To all bet -------------
	@IBAction func all_win(_ sender: UIButton)
	{
		
	}
	//-------------------------------------
	
	//-------------- To bet ---------------
	@IBAction func bet(_ sender: UIButton)
	{
		
	}
	//-------------------------------------
	
	//---------- Double the bet -----------
	@IBAction func double_bet(_ sender: UIButton)
	{
		
	}
	//-------------------------------------
	
	//---------- Deal and play  -----------
	@IBAction func deal_and_play(_ sender: UIButton)
	{
		let animation = Animation()
		var index = 0
		
		for back in arrayBackViews
		{
			if back.isHidden == true
			{
				animation.hideCard(from: arrayFaceViews[index],
				                   to: arrayBackViews[index])
			}
			index = index + 1
		}
		
		initialize()
	}
	
	//------------- New game  -------------
	@IBAction func new_game(_ sender: UIButton)
	{
		
	}
	//-------------------------------------
	
	//----- More credits at any time ------
	@IBAction func morecredits(_ sender: UIButton)
	{
		
	}
	//-------------------------------------
	
	//=====================================

	func initialize()
	{
		if chances == 0
		{
			return
		}
		else
		{
			chances = chances - 1
		}
		
		var cardSelected = true
		
		for backAnimation in arrayBacks
		{
			if backAnimation.layer.borderWidth != 1.0
			{
				cardSelected = false
				break
			}
		}
		
		if cardSelected == true
		{
			randomCards()
			return
		}
		for backAnimation in arrayBacks
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
		let metagame = MetaGame()
		let file: String = "png"		/* File type to create arrayOfCards */
		
		/* Return the random hand to theHand*/
		theHand = metagame.arrayOfRandomElements(arrayToCreateRandom: arrayToFill,
		                                         arrayToChoiceRandom: deck,
		                                         sizeOfRandomArray: 5)
		
		/* return the files from theHand to arrayOfCards */
		let arrayOfCards = metagame.createStringArrayOfFilesFromTouple(touple: theHand,
		                                                               fileType: file)
		
		displayCards(arrayOfStringFiles: arrayOfCards)
		
		permissionToSelectCards = true
		
		prepareForNextHand()
	}
	//--------------------------------------
	
	//----------- Show the cards -----------
	func displayCards(arrayOfStringFiles: [String])
	{
		let metagame = MetaGame()
		var counter = 0
		
		for slot in arraySlots
		{
			if slot.layer.borderWidth != 1				/* if its don't selected */
			{
				if chances == 0							/* if its second turn */
				{
					handToAnalyse = metagame.removeEmptySlotsAndReturnArray(toupleToAnalyse: handToAnalyse)
					
					handToAnalyse.append(theHand[counter]) /* Add theHand to final hand analyse */
				}
				slot.image = UIImage(named: arrayOfStringFiles[counter]) /* Fist turn add cards on voids slots */
				
				Timer.scheduledTimer(timeInterval: 0.5,		/* if card was set image turn */
				                     target: self,
				                     selector: #selector(turnCartes),
				                     userInfo: nil,
				                     repeats: false)
			}
			counter = counter + 1
		}
		if chances == 0
		{
			verifyHand(hand: handToAnalyse)
		}
	}
	
	//-------- Turn to reveal cards --------
	@objc func turnCartes()
	{
		let animation = Animation()
		var index = 0
		for slot in arraySlots
		{
			if slot.layer.borderWidth != 1
			{
				animation.showCard(from: arrayBackViews[index], to: arrayFaceViews[index])
			}
			index = index + 1
		}
		return
	}
	//--------------------------------------
	
	//------------------  -----------------
	
	func prepareForNextHand()
	{
		let metagame = MetaGame()
		
		if chances == 0
		{
			permissionToSelectCards = false
			dealButton.alpha = 0.5
			chances = 2
			deck = metagame.createDeck()
			handToAnalyse = [(0, ""), (0, ""), (0, ""), (0, ""), (0, "")]
			bet = 0
			
			resetCards()
		}
	}
	//--------------------------------------
	
	//------  ------
	func resetCards()
	{
		let animation = Animation()
		for index in 0...4
		{
			arrayBacks[index].layer.borderWidth = 0.5
			arrayBgs[index].layer.borderWidth = 0.0
			arrayBgs[index].layer.backgroundColor = nil
			arrayKeep[index].isHidden = true
			
			animation.hideCard(from: arrayFaceViews[index],
			                   to: arrayBackViews[index])
		}
	}

	//------  ------
	func verifyHand(hand: [(Int, String)])
	{
		let pokerHands = PokerHands()
		let animation = Animation()
		if pokerHands.royalFlush(hand: hand)
		{
			animation.animationLayers(label: carmem_royal_flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.red.cgColor,
			                          repeating: 10)
			
			calculateHand(times: 250)
		}
		else if pokerHands.straightFlush(hand: hand)
		{
			animation.animationLayers(label: straight_flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 50)
		}
		else if pokerHands.fourKind(hand: hand)
		{
			animation.animationLayers(label: four_of_kind,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 25)
		}
		else if pokerHands.fullHouse(hand: hand)
		{
			animation.animationLayers(label: full_house,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 9)
		}
		else if pokerHands.flush(hand: hand)
		{
			animation.animationLayers(label: flush,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 6)
		}
		else if pokerHands.straight(hand: hand)
		{
			animation.animationLayers(label: straight,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 4)
		}
		else if pokerHands.threeKind(hand: hand)
		{
			animation.animationLayers(label: three_of_kind,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 3)
		}
		else if pokerHands.twoPairs(hand: hand)
		{
			animation.animationLayers(label: two_pair,
			                          borderWidth: 5,
			                          borderColor: UIColor.yellow.cgColor,
			                          bgColor: UIColor.white.cgColor,
			                          repeating: 10)
			calculateHand(times: 2)
		}
		else if pokerHands.onePair(hand: hand)
		{
			animation.animationLayers(label: jacks_or_better,
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
		credits += (times * bet)
		credits_label.text = "$\(credits)"
	}
	//--------------------------------------
	
}




























