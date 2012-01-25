-----------------------------------
-- Area: Davoi
-- NPC:  Storage Hole
-- Involved in Quest: The Crimson Trial
-- @zone 149
-- @pos -51 4 -217
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(1103,1) and trade:getItemCount() == 1) then
			player:tradeComplete();
			player:messageSpecial(KEYITEM_OBTAINED,ORCISH_DRIED_FOOD);
			player:addKeyItem(ORCISH_DRIED_FOOD);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(1001);
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

	if(csid == 0x11) then
		player:setVar("peace_for_the_spirit_status",2);
	elseif(csid == 0xE) then
		player:setVar("peace_for_the_spirit_status",6);
	end
	
end;