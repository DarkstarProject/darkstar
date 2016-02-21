-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  Song Runes
-- Finishes Quest: Path of the Bard
-- @pos -721 -7 102 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(JEUNO,PATH_OF_THE_BARD) == QUEST_AVAILABLE and player:getVar("PathOfTheBard_Event") == 1) then
        player:startEvent(0x0002);
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
    
    if (csid == 0x0002) then
        player:addGil(GIL_RATE*3000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
        player:addTitle(WANDERING_MINSTREL);
        player:unlockJob(10); -- Bard
        player:messageSpecial(UNLOCK_BARD);  --You can now become a bard!
        player:setVar("PathOfTheBard_Event",0);
        player:addFame(JEUNO,30);
        player:completeQuest(JEUNO,PATH_OF_THE_BARD);
    end
    
end;