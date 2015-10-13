-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Ryo
-- Type: ZNM
-- @pos -127.086 0.999 22.693 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/besieged");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0391);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("updateRESULT: %u",option);
	
	if (option == 300) then
		player:updateEvent(player:getCurrency("zeni_point"),0);
	else
		player:updateEvent(0,0);
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("finishCSID: %u",csid);
	-- printf("finishRESULT: %u",option);
end;