-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  qm2 (???)
-- Involved In Quest: Messenger from Beyond
-- @pos -716 -10 66 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(SANDORIA,MESSENGER_FROM_BEYOND) == QUEST_ACCEPTED and player:hasItem(1096) == false) then
		SpawnMob(17199566,300):updateClaim(player);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;