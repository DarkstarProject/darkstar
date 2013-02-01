-----------------------------------
-- Area: Bibiki Bay
-- NPC:  ??? (Spawn Shen)
-- 
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Shrimp Lantern
	if(GetMobAction(16793859) == 0 and trade:hasItemQty(1823,1) and trade:getItemCount() == 1)then
	  	player:tradeComplete();
		SpawnMob(16793859,180):updateEnmity(player);
		SpawnMob(16793860,180):updateEnmity(player);
		SpawnMob(16793861,180):updateEnmity(player);
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