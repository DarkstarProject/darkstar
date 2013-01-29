-----------------------------------
-- Area: Dragons Aery
-- NPC:  ??? (Spawn Nidhogg)
-- @pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dragons_Aery/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Fafnir = GetMobAction(17408018);
	local Nidhogg = GetMobAction(17408019);
	
	-- Trade Cup of Sweet Tea
	if((Nidhogg == 0 or Nidhogg == 24) and trade:hasItemQty(3340,1) and trade:getItemCount() == 1) then -- Check trade, and if mob is ACTION_NONE (0) or waiting to spawn (24)
		player:tradeComplete();
		SpawnMob(17408019,180):updateEnmity(player);
	-- Trade Cup of Honey Wine
	elseif((Fafnir == 0 or Fafnir == 24) and trade:hasItemQty(3339,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		SpawnMob(17408018,180):updateEnmity(player);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_ORDINARY_HERE);
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