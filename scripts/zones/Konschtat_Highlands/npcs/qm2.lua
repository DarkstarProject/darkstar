-----------------------------------
-- Area: Konschtat Highlands
-- NPC: qm1
-- Continues Quests: Past Perfect
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil	= trade:getGil();
	
	if (count == 1 and gil == 0 and trade:hasItemQty(ORIENTAL_STEEL,1)) then -- Oriental Steel
		if (GetMobAction(FORGER) == 0) then
			SpawnMob(FORGER, 288); -- Despawn after inactive for 5 minutes
			player:tradeComplete();
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(FORGER_DIALOG);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;