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
	
	-- Trade Cup of Sweet Tea
	if(GetMobAction(17408019) == 0 and trade:hasItemQty(3340,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17408019,180):updateEnmity(player);
	-- Trade Cup of Honey Wine
	if(GetMobAction(17408019) == 0 and trade:hasItemQty(3339,1) and trade:getItemCount() == 1) then 
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