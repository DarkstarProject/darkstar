-----------------------------------
-- Area: Yhoator Jungle
-- NPC:  ??? Used for Norg quest "Stop Your Whining"
-- @zone 124 (G-8)
-- @pos -94.073, -0.999, 22.295
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Yhoator_Jungle/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	StopWhining = player:getQuestStatus(OUTLANDS,STOP_YOUR_WHINING);
	
	if(StopWhining == QUEST_ACCEPTED and player:hasKeyItem(261) == false and player:hasKeyItem(250)) then
		player:messageSpecial(TREE_CHECK);
		player:addKeyItem(261); --Filled Barrel
		player:messageSpecial(KEYITEM_OBTAINED,261);
		player:delKeyItem(260); --Empty Barrel
	elseif(StopWhining == QUEST_ACCEPTED and player:hasKeyItem(261) == true) then
		player:messageSpecial(TREE_FULL); --Already have full barrel
	else
		player:messageSpecial(ORDINARY);
	end
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
		if(csid == 0x0001) then
			player:addKeyItem(296);
			player:messageSpecial(KEYITEM_OBTAINED,296);
		end
end;