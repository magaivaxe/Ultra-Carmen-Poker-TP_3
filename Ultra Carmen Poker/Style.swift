
// Class to the Styles in the Ultra Carmem Poker

import Foundation
import UIKit

class Style
{
	//============ THE CLASSES ============
	
	
	
	//=====================================
	
	
	//--------- To Stylize slots ----------						/* To stylize slots and back_images */
	func styleImageViews(arrayImageViews s: [UIImageView],		/* array to stylize */
						 radius r: CGFloat,						/* value to radius */
						 borderWidth w: CGFloat,				/* value to border width */
						 borderColor c: CGColor,				/* color to border */
						 bgColor g: CGColor!)					/* color to background */
	{
		for theIv in s
		{
			theIv.clipsToBounds = true					/* Hide all inside the slots after to stylize */
			theIv.layer.cornerRadius = r
			theIv.layer.borderWidth = w
			theIv.layer.borderColor = c
			theIv.layer.backgroundColor = g
		}
	}
	//-------------------------------------
	
	//--------- To Stylize Views ----------					/* To stylize bgs face and back views */
	func styleViews(arrayViews b: [UIView],
				    radius r: CGFloat,
				    borderWidth w: CGFloat?,
				    borderColor c: CGColor,
				    bgColor g: CGColor?)
	{
		for view in b
		{
			view.clipsToBounds = true
			view.layer.cornerRadius = r
			view.layer.borderWidth = w ?? 0				/* if value is nil (w:CGFloat?) the value default is 0 */
			view.layer.borderColor = c
			view.layer.backgroundColor = g
		}
	}
	
	//-------------------------------------
	
	
	
	
	
}





















