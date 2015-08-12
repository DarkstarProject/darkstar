-----------------------------------
-- Area: Upper Jeuno
-- NPC: Deadly Minnow
-- Standard Merchant NPC
-- Involved in Quest: Borghertz's Hands (1st quest only)
-- @zone 244
-- @pos -5 1 48
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("BorghertzHandsFirstTime") == 1) then
		player:startEvent(0x0018);
		player:setVar("BorghertzHandsFirstTime",2);
	else
		player:showText(npc,DEADLYMINNOW_SHOP_DIALOG);

		stock = {0x309A,13179,	--Studded Bandana
				 0x3089,22800,	--Silver Mask
				 0x308A,47025,	--Banded Helm
				 0x311A,20976,	--Studded Vest
				 0x3109,35200,	--Silver Mail
				 0x310A,66792,	--Banded Mail
				 0x319A,11012,	--Studded Gloves
				 0x3189,18800,	--Silver Mittens
				 0x3180,23846,	--Gauntlets
				 0x318A,35673}	--Mufflers

		 
		showShop(player, STATIC, stock);
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



