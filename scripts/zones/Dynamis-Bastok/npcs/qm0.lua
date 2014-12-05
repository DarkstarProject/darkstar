-----------------------------------
-- Area:  Dynamis Bastok
-- NPC:   qm0 (???)
-- Notes: Spawns Megaboss when keyitem traded
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dynamis-Bastok/MobIDs");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:getItem(3354)) then -- Steelwall Bijou
		SpawnMob(GU_DHA_EFFIGY):updateEnmity(player);  -- Gu'Dha Effigy
	end
end;

-----------------------------------
-- onTrigger
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
