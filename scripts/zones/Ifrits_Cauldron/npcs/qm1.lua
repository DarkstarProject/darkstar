-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  qm1 (???) 
-- Notes: Used to spawn Tarasque
-- @pos 126 18 166 0
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Ifrits_Cauldron/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade a Rattling Egg to pop Tarasque
	if(GetMobAction(17617164) == 0 and trade:hasItemQty(1189,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		SpawnMob(17617164,900):updateClaim(player); -- Spawn Tarasque
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(EGGSHELLS_LIE_SCATTERED);
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