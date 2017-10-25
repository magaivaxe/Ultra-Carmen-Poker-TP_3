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
	
	//=====================================
	
	//=========== THE VARIABLES ===========
	
	var arrayBacksAnimation: [UIImage]!	 /* array of cards backs to animation */
	var arraySlots: [UIImageView]! 		 /* array of all game slots */
	var deck = [(Int, String)]()		 /* touple of the deck Int: card number, String: card suit */
	var arrayBgs: [UIView]!				 /* array of the backgrounds cards of UIView type */
	var arrayKeep: [UILabel]!			 /* array of the labels keep to show "GARDER" */
	
	//=====================================
	
	//============ THE CLASSES ============
	
	let metagame = MetaGame()				/* Call the class MetaGame() */
	let animation = Animation()				/* Call the class Animation() */
	let style = Style()						/* Call the class Style */
	
	//=====================================
	

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
		                 borderWidth: 0.5,						/* Its used to keep*/
		                 borderColor: UIColor.black.cgColor,
		                 bgColor: UIColor.yellow.cgColor)
		//-------------------------------------
	}
	
	//---- To create the others arrays ----		/* I tryed to place in metagame, but I failed */
	func fillArrays()
	{
		var arraySlots = [slot_1, slot_2, slot_3, slot_4, slot_5]		/* array of UIImageView */
		var arrayKeep = [keep_1, keep_2, keep_3, keep_4, keep_5]		/* array of UILabels */
		var arrayBgs = [bg_1, bg_2, bg_3, bg_4, bg_5]					/* array of UIViews */
		var arrayFaceView = [face_view_1, face_view_2,
		                     face_view_3, face_view_4,
		                     face_view_5]
		var arrayBackView = [back_view_1, back_view_2,
		                     back_view_3, back_view_4,
		                     back_view_5]
	}
	//-------------------------------------

	//============ THE BUTTONS ============
	
	//-------- To keep the cards ----------
	@IBAction func keep_cards(_ sender: UIButton)
	{
		if arrayBgs[sender.tag].layer.borderWidth == 0.5
		{
			
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
		
	}
	//-------------------------------------
	
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



























