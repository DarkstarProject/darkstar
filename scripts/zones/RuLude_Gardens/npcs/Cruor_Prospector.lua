-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC: Cruor Prospector
-- Abyssea gear merchant.
-----------------------------------

require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/commands/additem");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

-----------------------prices 10x current FFXIAH-------------------

    secretshop = {19270,300000,   -- Quartz Tathlum
                  19249,200000,   -- Thew Bomblet
				  19250,300000,   -- Witchstone
				  19259,65000,    -- Clarus Stone
				  19258,100000,   -- Qirmiz Tathlum
				  19257,2000000,  -- Incantor Stone
				  19761,7000000,  -- Impatiens
				  19767,5000000,  -- Oneiros Pebble
				  19766,1000000,  -- Fracas Grenade
				  19765,200000,   -- Demonry Stone
				  19764,165000,   -- Demonry Core
				  19762,300000,   -- Oneiros Tathlum				  
				  19261,100000}   -- Jinx Discus
	
	if (trade:hasItemQty(548,1) and trade:getItemCount() == 1) then
		showShop(player, STATIC, secretshop);
	    player:showText(npc,ABYSSEA_SHOP_DIALOG2);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local mJob = player:getMainJob();
-----------------------------------
--- Job Related Content per job ---
-----------------------------------        
           --------------Job Items--------------- ------------------------------- AF3-----------------------------------
	war = {11703,250000,11591,250000,19253,250000,12008,1000000,12028,1000000,12048,1000000,12068,1000000,12088,1000000}
	mnk = {11704,250000,11592,250000,19254,250000,12009,1000000,12029,1000000,12049,1000000,12069,1000000,12089,1000000}
	whm = {11705,250000,11615,250000,11554,250000,12010,1000000,12030,1000000,12050,1000000,12070,1000000,12090,1000000}
	blm = {11706,250000,11593,250000,16203,250000,12011,1000000,12031,1000000,12051,1000000,12071,1000000,12091,1000000}
	rdm = {11707,250000,11594,250000,16204,250000,12012,1000000,12032,1000000,12052,1000000,12072,1000000,12092,1000000}
	thf = {11708,250000,11736,250000,19260,250000,12013,1000000,12033,1000000,12053,1000000,12073,1000000,12093,1000000}
	pld = {11709,250000,11595,250000,11750,250000,12014,1000000,12034,1000000,12054,1000000,12074,1000000,12094,1000000}		  
	drk = {12015,250000,11737,250000,11710,250000,12015,1000000,12035,1000000,12055,1000000,12075,1000000,12095,1000000}		  
	bst = {11711,250000,11617,250000,11555,250000,12016,1000000,12036,1000000,12056,1000000,12076,1000000,12096,1000000}
	brd = {11618,250000,11712,250000,11738,250000,12017,1000000,12037,1000000,12057,1000000,12077,1000000,12097,1000000}
	rng = {11596,250000,11713,250000,16205,250000,12018,1000000,12038,1000000,12058,1000000,12078,1000000,12098,1000000}
	sam = {11597,250000,11714,250000,16206,250000,12019,1000000,12039,1000000,12059,1000000,12079,1000000,12099,1000000}
	nin = {16207,250000,11715,250000,11598,250000,12020,1000000,12040,1000000,12060,1000000,12080,1000000,12100,1000000}
	drg = {11599,250000,11716,250000,16208,250000,12021,1000000,12041,1000000,12061,1000000,12081,1000000,12101,1000000}
	smn = {11739,250000,11717,250000,11619,250000,12022,1000000,12042,1000000,12062,1000000,12082,1000000,12102,1000000}	
	blu = {11600,250000,11718,250000,19255,250000,12023,1000000,12043,1000000,12063,1000000,12083,1000000,12103,1000000}	
    cor = {16209,250000,11719,250000,11601,250000,12024,1000000,12044,1000000,12064,1000000,12084,1000000,12104,1000000}	
	pup = {11602,250000,11720,250000,11751,250000,12025,1000000,12045,1000000,12065,1000000,12085,1000000,12105,1000000}	
	dnc = {11603,250000,11721,250000,19256,250000,12026,1000000,12046,1000000,12066,1000000,12086,1000000,12106,1000000}	
	sch = {19247,250000,11722,250000,11620,250000,12027,1000000,12047,1000000,12067,1000000,12087,1000000,12107,1000000}
-----------------------------------	
	if(mJob == 1) then   	  	   	   
	   showShop(player, STATIC, war);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for WAR -- -- --	   	
	return 1   
	end		
    if(mJob == 2) then   	  	   	   
	   showShop(player, STATIC, mnk);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for MNK -- -- --	   	
	return 1   
	end			
    if(mJob == 3) then   	  	   	   
	   showShop(player, STATIC, whm);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for WHM -- -- --	   
	return 1   
	end		
    if(mJob == 4) then   	  	   	   
	   showShop(player, STATIC, blm);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for BLM -- -- --	   	
	return 1   
	end		
	if(mJob == 5) then   	  	   	   
	   showShop(player, STATIC, rdm);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for RDM -- -- --	   	
	return 1   
	end 		
	if(mJob == 6) then   	  	   	   
	   showShop(player, STATIC, thf);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for THF -- -- --	  
	return 1   
	end		
	if(mJob == 7) then   	  	   	   
	   showShop(player, STATIC, pld);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for PLD -- -- --	   	
	return 1   
	end			
	if(mJob == 8) then   	  	   	   
	   showShop(player, STATIC, drk);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for DRK -- -- --	   
	return 1   
	end   	
    if(mJob == 9) then   	  	   	   
	   showShop(player, STATIC, bst);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for BST -- -- --	   	
	return 1   
	end		
    if(mJob == 10) then   	  	   	   
	   showShop(player, STATIC, brd);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for BRD -- -- --	   	
	return 1   
	end		
	if(mJob == 11) then   	  	   	   
	   showShop(player, STATIC, rng);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for RNG -- -- --	   	
	return 1   
	end   		
    if(mJob == 12) then   	  	   	   
	   showShop(player, STATIC, sam);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for SAM -- -- --	   	
	return 1   
	end  		
	if(mJob == 13) then   	  	   	   
	   showShop(player, STATIC, nin);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for NIN -- -- --	   	
	return 1   
	end		
	if(mJob == 14) then   	  	   	   
	   showShop(player, STATIC, drg);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for DRG -- -- --	   	
	return 1   
	end
	if(mJob == 15) then   	  	   	   
	   showShop(player, STATIC, smn);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for SMN -- -- --	   
	return 1   
	end
	if(mJob == 16) then   	  	   	   
	   showShop(player, STATIC, blu);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for BLU -- -- --	   
	return 1   
	end
	if(mJob == 17) then   	  	   	   
	   showShop(player, STATIC, cor);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for COR -- -- --	   
	return 1   
	end
	if(mJob == 18) then   	  	   	   
	   showShop(player, STATIC, pup);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for PUP -- -- --	   
	return 1   
	end
	if(mJob == 19) then   	  	   	   
	   showShop(player, STATIC, dnc);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for DNC -- -- --	   
	return 1   
	end
	if(mJob == 20) then   	  	   	   
	   showShop(player, STATIC, sch);
	   player:showText(npc,ABYSSEA_SHOP_DIALOG); -- -- -- Shop for SCH -- -- --	   	
	return 1   
	end	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;