-----------------------------------
-- Area: King Ranperre's Tomb
-- NPC:  Tombstone
-- Involved in Quest: Grave Concerns
-- @pos 1 0.1 -101 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	    if (player:getQuestStatus(SANDORIA,GRAVE_CONCERNS) == QUEST_ACCEPTED) then
		    if (trade:hasItemQty(567,1) and trade:getItemCount() == 1) then -- Trade Well Water
			player:startEvent(0x0003);
		    end
	    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
	local currentMission = player:getCurrentMission(SANDORIA);
	local MissionStatus = player:getVar("MissionStatus");	
	local BatHuntCompleted = player:hasCompletedMission(SANDORIA,BAT_HUNT); -- quest repeatable and clicking tombstone should not produce cutscene on repeat
	local X = npc:getXPos();
	local Z = npc:getZPos();
	
	if (X >= -1 and X <= 1 and Z >= -106 and Z <= -102) then
		if (currentMission == BAT_HUNT and MissionStatus == 1) then 
			player:startEvent(0x0004);
		else
			player:startEvent(0x0002);
		end
	elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 2) then
		player:startEvent(0x0008);
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
	
	if (csid == 0x0004) then
		player:setVar("MissionStatus",2);
	elseif (csid == 0x0002) then
		local graveConcerns = player:getQuestStatus(SANDORIA,GRAVE_CONCERNS);
		
		if (graveConcerns == QUEST_ACCEPTED and player:hasItem(547) == false and player:hasItem(567) == false) then 
			if (player:getFreeSlotsCount() == 0) then 
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,547); -- Tomb Waterskin
			else
				player:addItem(547);
				player:messageSpecial(ITEM_OBTAINED,547); -- Tomb Waterskin
			end
		end
	elseif (csid == 0x0003) then
		player:tradeComplete();
		player:setVar("OfferingWaterOK",1);
		player:addItem(547);
		player:messageSpecial(ITEM_OBTAINED,547); -- Tomb Waterskin
	elseif (csid == 0x0008) then
	    player:setVar("MissionStatus",3);
		player:addKeyItem(ANCIENT_SANDORIAN_BOOK);
		player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_SANDORIAN_BOOK);
	end
	
end;
