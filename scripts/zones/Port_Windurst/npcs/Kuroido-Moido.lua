-----------------------------------
--	Area: Port Windurst
--	NPC:  Kuriodo-Moido
--  Involved In Quest: Making Amends
--	Working 100%
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS);
	if (MakingAmends == QUEST_ACCEPTED) then -- MAKING AMENDS: During Quest
		player:startEvent(0x0114); 
	elseif (MakingAmends == QUEST_COMPLETED and player:needToZone()) then -- MAKING AMENDS: After Quest  
		player:startEvent(0x0117); 
	else
		rand = math.random(1,2)
		if (rand == 1) then
			player:startEvent(0x00e1);   -- Standard Conversation
		else
			player:startEvent(0x00e2);   -- Standard Conversation
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
end;



