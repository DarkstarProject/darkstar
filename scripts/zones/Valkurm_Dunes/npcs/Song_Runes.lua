-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Song Runes
-- Finishes Quest: Path of the Bard
-- !pos -721 -7 102 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Valkurm_Dunes/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- PATH OF THE BARD (Bard Flag)
    if (player:getQuestStatus(JEUNO,PATH_OF_THE_BARD) == QUEST_AVAILABLE and player:getVar("PathOfTheBard_Event") == 1) then
        player:startEvent(2);

    -- DEFAULT DIALOG
    else
        player:messageSpecial(SONG_RUNES_DEFAULT);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:addGil(GIL_RATE*3000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
        player:addTitle(WANDERING_MINSTREL);
        player:unlockJob(JOBS.BRD); -- Bard
        player:messageSpecial(UNLOCK_BARD);  --You can now become a bard!
        player:setVar("PathOfTheBard_Event",0);
        player:addFame(JEUNO,30);
        player:completeQuest(JEUNO,PATH_OF_THE_BARD);
    end
end;
