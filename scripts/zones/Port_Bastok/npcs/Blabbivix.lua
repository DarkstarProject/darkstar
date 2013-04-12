-----------------------------------
--	Area: Port Bastok
--	NPC: Blabbivix
--	Standard merchant, though he acts like a guild merchant
-----------------------------------

package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/globals/settings");
--require("scripts/globals/shop");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:sendGuild(60418,11,22,3)) then
		player:showText(npc,BLABBIVIX_SHOP_DIALOG);

--		stock = {0x01e1,21000,		-- Black Chip
--				 0x01db,21000,		-- Blue Chip
--				 0x01de,21000,		-- Clear Chip
--				 0x01dd,21000,		-- Green Chip
--				 0x01de,21000,		-- Purple Chip
--				 0x01da,21000,		-- Red Chip
--				 0x01e0,21000,		-- White Chip
--				 0x01dc,21000}		-- Yellow Chip 
--		showShop(player, STATIC, stock);
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



