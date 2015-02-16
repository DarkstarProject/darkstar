-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Mathlouq
--  Type: Standard NPC
--  @pos -92.892 -7 129.277 50
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
artsAndCrafts_Mathloug = player:getVar("QUEST_ARTSANDCRAFTS_MATHLOUQ");

	if (artsAndCrafts == 1 and artsAndCrafts_Mathloug ~= 1) then
		player:startEvent(0x01FF);
	else
		player:startEvent(0x021F);
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
	if (csid == 0x01FF) then
		player:setVar("QUEST_ARTSANDCRAFTS_MATHLOUQ",1);
	end
end;
