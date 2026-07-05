                               _____________________________________
==============================| Aura by xcheatdeath |==============================
                               ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯         

 - Contact: xcheatdeath on discord or taygamingbox@gmail.com
 
 - Website: https://app.mediafire.com/folder/6sm13fkq2v8jp or https://drive.google.com/drive/folders/1s2a2p4FvR5maY6-2HSNabCJz2D4MKw1G?usp=drive_link
 
 - If you downloaded this file from anywhere else, it's probably outdated

=========================================< INSTALLATION >==========================================

 - Copy the "aura.zss" file to Ikemen GO's "data" folder

 - Inside Ikemen's "save" folder, open the "config.ini" file with a text editor

 - Under [Common], find this line: States =

 - Add this to it: "data/aura.zss"

 - You're all set
=========================================< INTRODUCTION >==========================================

This is an expansion of Toukachan6035's Glow modul.


=======================================< LIST OF CHANGES >=========================================

N/A as of initial release

============================================< F.A.Q. >=============================================

Q: Can I change the color of the aura?
A: Yes. I made it as simple as possible and left notes in aura.zss 
 >Open aura.zss and look for [Statedef +1]
  >you will see several lines that start with the words "Call Glow"
   >call glow(15, 50, 10, X,X,X, 1, 92000, 1, 1)
    >The 'x' letters above are Red,Green,Blue respectively. the values can range between -255 and 255
	 >Play around with those Values until you achieve a color you're happy with
	 
	 
Q: Can I make max power level a solid color and not rainbow?
A: Yes. 
  > Open aura.zss and look for [Statedef +1]
   >then look for the line that has "if !isHelper &&  power >= 3000"
    >call glow(35, 30, 5.5, 175 + 175*cos(gameTime * 0.1),180 + 180* sin (gameTime * 0.08),180 + 180 * cos (gameTime * 0.05 +45), 1, 92000, 1, 1);
	 >replace that line with this
	   >call glow(15, 50, 10, 255,255,255, 1, 92000, 1, 1)
	    >adjust the R,G,B values (255,255,255) until you achieve the color you're happy with

Q: The aura is kind of small/large can I adjust the size of it?
A: Yes
	>Open aura.zss and look for [Statedef +1]
	 >you will see several lines that start with the words "Call Glow"
		>call glow(15, 50, X, 100,255,0, 1, 92000, 1, 1)
		 >The X above controls the size of the aura around the characters. default is 10. mess around until you find something you like!

Q: Can i make the aura more pixelated/solid?
A: Yes
	>Open aura.zss and look for [Statedef +1]
	 >you will see several lines that start with the words "Call Glow"
		>call glow(X, X, 10, 100,255,0, 1, 92000, 1, 1)
		 >The X's above controls the alpha(opacity) and quality(pixelated-ness?) of the aura around the characters. default is 15 and 50 respectively. mess around until you find something you like!
		 

 
=========================================< KNOWN ISSUES >==========================================

 - none atm but this'll probably change since it's released


=======================================< VERSION HISTORY >=========================================

<Sept.06.2025>
 - First release



========================================< WHAT'S MISSING >=========================================

 - Nothing. does everything I want it do currently. 



========================================< SPECIAL THANKS >=========================================

 - Toukachan6035 for the original GLOW effect Module, which this uses as a base.
 - P.O.T.S I stole this layout from his module readme's and for helping with the custom state code! 
 - The Ikemen GO devs for all that they do. I'd probably still be wasting my life on destiny 2 w/o y'all 
