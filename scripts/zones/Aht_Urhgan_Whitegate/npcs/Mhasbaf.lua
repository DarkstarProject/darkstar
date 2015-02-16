-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Mhasbaf
--  Type: Standard NPC
--  @pos 54.701 -6.999 11.387 50
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
artsAndCrafts_Mhasbaf = player:getVar("QUEST_ARTSANDCRAFTS_MHASBAF");

	if (artsAndCrafts == 1 and artsAndCrafts_Mhasbaf ~= 1) then
		player:startEvent(0x01FE);
	else
		player:startEvent(0x021E);
	end
end;

-----------------------------------
-- onTrade Action
function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventFinish Action
function onEventFinish(player,csid,option)
	if (csid == 0x01FE) then
		player:setVar("QUEST_ARTSANDCRAFTS_MHASBAF",1);
	end
end;
