
//Class to define the meta game or to do all to ready the game

import Foundation
import UIKit

class MetaGame
{
	//============ THE CLASSES ============
	

	
	//=====================================
	
	
	//-------- Create the deck ------------					/* Create the index of cards of type (number, "x") where x is the suits and return him */
	func createDeck() ->[(Int, String)]
	{
		var d = [(Int, String)]()
		for a in 0...3
		{
			let suits = ["d", "h", "c", "s"]
			for b in 0...13
			{
				d.append((b, suits[a]))
			}
		}
		return d
	}
	//--------------------------------------
	
	//----- Create the array of backs ------			/* Create the array of card back to animation */
														/* I tryed to do the boucle to fill the array and to assign the variables, but I failed */
	func backsFilesToArray()->[UIImage]
	{
		var a1: UIImage!; var a2: UIImage!; var a3: UIImage!
		var a4: UIImage!; var a5: UIImage!; var a6: UIImage!
		var a7: UIImage!; var a8: UIImage!; var a9: UIImage!
		var a10: UIImage!; var a11: UIImage!; var a12: UIImage!
		var a13: UIImage!; var a14: UIImage!; var a15: UIImage!
		var a16: UIImage!; var a17: UIImage!; var a18: UIImage!
		var a19: UIImage!; var a20: UIImage!; var a21: UIImage!
		var a22: UIImage!; var a23: UIImage!; var a24: UIImage!
		var a25: UIImage!; var a26: UIImage!; var a27: UIImage!
		var a28: UIImage!; var a29: UIImage!; var a30: UIImage!
		var a31: UIImage!; var a32: UIImage!; var a33: UIImage!
		var a34: UIImage!; var a35: UIImage!; var a0: UIImage!
		
		a0 = UIImage(named: "a0.png"); a1 = UIImage(named: "a1.png"); a2 = UIImage(named: "a2.png")
		a3 = UIImage(named: "a3.png"); a4 = UIImage(named: "a4.png"); a5 = UIImage(named: "a5.png")
		a6 = UIImage(named: "a6.png"); a7 = UIImage(named: "a7.png"); a8 = UIImage(named: "a8.png")
		a9 = UIImage(named: "a9.png"); a10 = UIImage(named: "a10.png"); a11 = UIImage(named: "a11.png")
		a12 = UIImage(named: "a12.png"); a13 = UIImage(named: "a13.png"); a14 = UIImage(named: "a14.png")
		a15 = UIImage(named: "a15.png"); a16 = UIImage(named: "a16.png"); a17 = UIImage(named: "a17.png")
		a18 = UIImage(named: "a18.png"); a19 = UIImage(named: "a19.png"); a20 = UIImage(named: "a20.png")
		a21 = UIImage(named: "a21.png"); a22 = UIImage(named: "a22.png"); a23 = UIImage(named: "a23.png")
		a24 = UIImage(named: "a24.png"); a25 = UIImage(named: "a25.png"); a26 = UIImage(named: "a26.png")
		a27 = UIImage(named: "a27.png"); a28 = UIImage(named: "a28.png"); a29 = UIImage(named: "a29.png")
		a30 = UIImage(named: "a30.png"); a31 = UIImage(named: "a31.png"); a32 = UIImage(named: "a32.png")
		a33 = UIImage(named: "a33.png"); a34 = UIImage(named: "a34.png"); a35 = UIImage(named: "a35.png")
		
		let arrayOfVar = [a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10,
		               a11, a12, a13, a14, a15, a16, a17, a18, a19,
		               a20, a21, a22, a23, a24, a25, a26, a27, a28,
		               a29, a30, a31, a32, a33, a34, a35]
		
		return arrayOfVar as! [UIImage] 		/* return the arrayOfVar as UIImage */
	}
}





















