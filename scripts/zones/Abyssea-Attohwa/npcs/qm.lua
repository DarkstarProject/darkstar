-----------------------------------
-- Area: Abyssea Attohwa
-- NPC:  qm (???) 
-- Notes: Used to spawn Blazing Eruca
-- @pos 233 19 -243
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade 
	if(GetMobAction(17658262) == 0 and trade:hasItemQty(3073,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		SpawnMob(17658262,900):updateEnmity(player); -- Spawn Blazing Eruca
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

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