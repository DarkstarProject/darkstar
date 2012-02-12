-----------------------------------
-- Area: FeiYin
-- NPC:  ???
-- Involved In Quest: Pieuje's Decision
-- @zone 204
-- @pos -55 -16 69
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:hasItem(13842) == false) then
		if(trade:hasItemQty(1098,1) and trade:getItemCount() == 1) then -- Trade Tavnazia Bell
			player:tradeComplete();
			player:messageSpecial(SENSE_OF_FOREBODING);
			SpawnMob(17612836,180):updateEnmity(player);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(THERE_IS_NOTHING_ORDINARY);
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