-----------------------------------
-- Area: FeiYin
-- NPC:  Dry Fountain
-- Involved In Quest: Peace for the Spirit
-- @pos -17 -16 71 204
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(1093,1) and trade:getItemCount() == 1) then -- Trade Antique Coin
			player:startEvent(0x0011);
		end
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

	if (csid == 0x0011) then
		player:tradeComplete();
		player:setVar("peaceForTheSpiritCS",2);
	end

end;