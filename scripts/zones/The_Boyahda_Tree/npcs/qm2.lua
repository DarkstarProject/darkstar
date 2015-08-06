-----------------------------------
-- Area: The Boyahda Tree
-- NPC: qm2 (???)
-- Involved in Quest: Searching for the Right Words
-- @pos 34.651 -20.183 -61.647 153
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Boyahda_Tree/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------


-- Notes: does ??? depop when Agas is spawned?
-- current implementation: when Agas is active, triggering ??? will result in detarget

function onTrigger(player,npc)

	local SearchingForWords = player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);
	local zoneHour = VanadielHour();
	local zoneMinute = VanadielMinute();
	local correctTime = zoneHour >= 19 or zoneHour < 4 or (zoneHour == 4 and zoneMinute == 0);
	
	if (GetMobAction(17404337) == 0) then
		if (player:hasKeyItem(MOONDROP)) then
			player:messageSpecial(CAN_SEE_SKY);
			
		elseif (SearchingForWords == QUEST_ACCEPTED) then
		
			if (IsMoonNew() or not correctTime) then
				player:messageSpecial(CANNOT_SEE_MOON);
				
			elseif (player:getVar("Searching_AgasKilled") == 1) then
				player:startEvent(0x000e);
				
			else
				player:messageSpecial(SOMETHING_NOT_RIGHT);
				SpawnMob(17404337,288):updateClaim(player); --missing repop timer for Agas due to errors with SpawnMob
			end
			
		else
			player:messageSpecial(CAN_SEE_SKY);
		end
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
	if (csid == 0x000e) then
		player:addKeyItem(MOONDROP);
		player:messageSpecial(KEYITEM_OBTAINED, MOONDROP);
		player:setVar("Searching_AgasKilled", 0);
	end
	
end;
