-----------------------------------
-- Area: Open sea route to Mhaura
-- NPC:  Pashi Maccaleh
-- Guild Merchant NPC: Fishing Guild 
-- @zone 4.986 -2.101 -12.026 47
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Open_sea_route_to_Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:sendGuild(523,1,23,5)) then
		player:showText(npc,PASHI_MACCALEH_SHOP_DIALOG);
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



