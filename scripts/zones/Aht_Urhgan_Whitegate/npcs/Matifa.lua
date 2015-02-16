-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Matifa
--  Type: Standard NPC
--  @pos -10.583 -1 -8.820 50
-----------------------------------
-- Includes
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	   artsAndCrafts = player:getQuestStatus(AHT_URHGAN,ARTS_AND_CRAFTS);
artsAndCrafts_Matifa = player:getVar("QUEST_ARTSANDCRAFTS_MATIFA");

	if (artsAndCrafts == 1 and artsAndCrafts_Matifa ~= 1) then
		player:startEvent(0x0204);
	else
		player:startEvent(0x021D);
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x0204) then
		player:setVar("QUEST_ARTSANDCRAFTS_MATIFA",1);
	end
end;
