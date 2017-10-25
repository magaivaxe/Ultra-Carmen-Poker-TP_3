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
	
	var arrayBacksAnimation: [UIImage]!	 /* array of cards backs to animation */
	var arraySlots: [UIImageView]! 		 /* array of all game slots */
	var deck = [(Int, String)]()		 /* touple of the deck Int: card number, String: card suit */
	var arrayBgs: [UIView]!				 /* array of the backgrounds cards of UIView type */
	var arrayKeep: [UILabel]!			 /* array of the labels keep to show "GARDER" */
	var arrayFaceViews: [UIView]!		 /* array of the face views to flip and reflip */
	var arrayBackViews: [UIView]!		 /* array of the back views to flip and reflip */
	
	var theHand = [(Int, String)]()		 /* Touple to do the hand to play*/
	
	var permissionCards = false
	var bet = 0
	var credits = 2000
	var chances = 2
	var handToAnalyse = [(0, ""), (0, ""), (0, ""), (0, ""), (0, "")]
	
	//------------ THE CLASSES ------------
	let metagame = MetaGame()				/* Call the class MetaGame() */
	let style = Style()						/* Call the class Style() */
	let animation = Animation()				/* Call the class Animation() */
	let game = Game()
	//-------------------------------------
	
	//============ THE DIDLOAD ============
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		//---- To create the arrays cards -----
		deck = metagame.createDeck()							/* the deck */
		arrayBacksAnimation = metagame.backsFilesToArray()		/* array of UIImage */
		fillArrays()											/* Others arrays */
		//-------------------------------------
		
		//----- Stylized the backgrounds ------
		style.styleViews(arrayViews: arrayBgs,
		                 radius: 10,
		                 borderWidth: nil,
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
		
		//-------- Stylized the slots ---------
		style.styleImageViews(arrayImageViews: arraySlots,
		                      radius: 10,
		                      borderWidth: 0.5,					/* Its used to keep the cards */
		                      borderColor: UIColor.black.cgColor,
		                      bgColor: nil)
		
		//-------------------------------------
		
		//--------Prepered Animations ---------
		
		animation.animationSequentialCards(cards: arraySlots,
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
		arrayKeep = [keep_1, keep_2, keep_3, keep_4, keep_5]
		arrayBgs = [bg_1, bg_2, bg_3, bg_4, bg_5]
		arrayFaceViews = [face_view_1, face_view_2, face_view_3, face_view_4, face_view_5]
		arrayBackViews = [back_view_1, back_view_2, back_view_3, back_view_4, back_view_5]
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
		game.initialize()
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


}



























