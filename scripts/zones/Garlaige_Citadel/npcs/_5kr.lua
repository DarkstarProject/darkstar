-----------------------------------
-- Area: Garlaige Citadel
-- NPC: Crematory Hatch
-- Type: Door
-- @zone 200
-- @pos 139 -6 127
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(502,1) == true and trade:getItemCount() == 1) then -- This is the Garlaige Key, dropped from Fallen Evacuees. Should not be Garlaige Chest Key.
		player:startEvent(0x0004); -- Open the door
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	X = player:getXPos();
	Z = player:getZPos();
	
	if(X >= 135 and X <= 144 and Z >= 128 and Z <= 135) then 
		player:startEvent(0x0005);
	else
		player:messageSpecial(OPEN_WITH_THE_RIGHT_KEY);
		return 0;
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



