-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  ??? (Spawn Aspidochelone)
-- @pos 91 -3 -16
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valley_of_Sorrows/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Adamantoise = GetMobAction(17301537);
	local Aspidochelone = GetMobAction(17301538);
	
	-- Trade Clump of Red Pondweed
	if((Aspidochelone == 0 or Aspidochelone == 24) and trade:hasItemQty(3344,1) and trade:getItemCount() == 1) then -- Check trade, and if mob is ACTION_NONE (0) or waiting to spawn (24)
		player:tradeComplete();
		SpawnMob(17301538,180):updateEnmity(player);
	-- Trade Clump of Red Pondweed
	elseif((Adamantoise == 0 or Adamantoise == 24) and trade:hasItemQty(3343,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17301537,180):updateEnmity(player);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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