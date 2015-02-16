-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Balakaf
--  Type: Standard NPC
--  @pos 25.505 -6.999 126.478 50
-----------------------------------

--  Quest 'Arts and Crafts'(Involved)
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
		artsAndCrafts = player:getQuestStatus(AHT_URHGAN,ARTS_AND_CRAFTS);
artsAndCrafts_Balakaf = player:getVar("QUEST_ARTSANDCRAFTS_BALAKAF");

	if (artsAndCrafts == QUEST_ACCEPTED and artsAndCrafts_Balakaf ~= 1) then
		player:startEvent(0x0203);
	else
		player:startEvent(0x0221);
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
	if (csid == 0x0203) then
		player:setVar("QUEST_ARTSANDCRAFTS_BALAKAF",1);
	end
end;
