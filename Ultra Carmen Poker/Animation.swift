
// Class to do the animations in the ULTRA CARMEM POKER GAME...

import Foundation
import UIKit

class Animation
{
	//============ THE CLASSES ============
	
	
	
	//=====================================
	
	//-------------------------------------
	func showCard(from: UIView, to: UIView)			/* method to flip and show the card on table */
	{
		let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews] 	/* constant to do the transition turn from left */
		
		UIView.transition(with: from, duration: 0.5, options: transitionOptions, animations:	/* the cards go to the hide to show*/
		{
			from.isHidden = true
		})
		
		UIView.transition(with: to, duration: 0.5, options: transitionOptions, animations:
		{
			to.isHidden = false
		})
	}
	//-------------------------------------
	
	//-------------------------------------
	func hideCard(from: UIView, to: UIView)			/* method to reflip and hide the card on table */
	{
		let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]	/* constant to do the transition turn from right */
		
		UIView.transition(with: from, duration: 0.5, options: transitionOptions, animations:
		{
			from.isHidden = false
		})
		
		UIView.transition(with: to, duration: 0.5, options: transitionOptions, animations:
		{
			to.isHidden = true
		})
	}
	
	//-------------------------------------							/* method to pass the sequencial animated of the back of cards */
	func animationSequentialCards(cards c: [UIImageView],			/* Place to animation */
	                              duration d: Double,
	                              repeating r: Int,
	                              seqCards s: [UIImage])			/* Array to do the animation */
	{
		for imageView in c
		{
			imageView.animationDuration = d
			imageView.animationRepeatCount = r
			imageView.animationImages = s
		}
	}
	
	//-------------------------------------
	func animationRandomCards(arrayCards a:[UIImage]) ->[UIImage]		/* method to pick random cards of one array of cards */
	{
		var arrayToReturn = [UIImage]()
		var arrayOriginal = a
		
		for _ in 0..<a.count
		{
			let randomIndex = Int(arc4random_uniform(UInt32(arrayOriginal.count)))
			arrayToReturn.append(arrayOriginal[randomIndex])
			arrayOriginal.remove(at: randomIndex)
		}
		return arrayToReturn
	}
	//-------------------------------------
	
	//-------- Animations Layers ----------
	func animationLayers(label l: UILabel,
	                           borderWidth w: CGFloat,
	                           borderColor c: CGColor,
	                           bgColor g: CGColor,
	                           repeating r: Int)
	{
		for _ in 1...r
		{
			Timer.scheduledTimer(timeInterval: 0.2,
			                     target: self,
			                     selector: #selector(timeSchedule),
			                     userInfo: nil,
			                     repeats: false)
		}
		
		
	}
	@objc func timeSchedule(label l: UILabel,
	                        borderWidth w: CGFloat,
	                        borderColor c: CGColor,
	                        bgColor g: CGColor)
	{
		l.layer.borderWidth = w
		l.layer.borderColor = c
		l.layer.backgroundColor = g
	}
	//-------------------------------------
	
}
	



























