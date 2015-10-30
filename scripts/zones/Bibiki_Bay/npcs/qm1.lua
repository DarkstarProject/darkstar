-----------------------------------
-- Area:  Bibiki Bay
-- NPC:   ??? (qm1)
-- Notes: Used to spawn Shen
-- @pos -115.108 0.300 -724.664 4
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local Shen = 16793859;
	
	-- Trade Shrimp Lantern
	if (GetMobAction(Shen) == 0 and trade:hasItemQty(1823,1) and trade:getItemCount() == 1) then
	  	player:tradeComplete();
		SpawnMob(Shen,180):updateClaim(player);
		SpawnMob(Shen+1,180):updateClaim(player);
		SpawnMob(Shen+2,180):updateClaim(player);
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