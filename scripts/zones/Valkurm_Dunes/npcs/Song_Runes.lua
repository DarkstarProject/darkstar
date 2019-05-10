-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Song Runes
-- Finishes Quest: Path of the Bard
-- !pos -721 -7 102 103
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- PATH OF THE BARD (Bard Flag)
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.PATH_OF_THE_BARD) == QUEST_AVAILABLE and player:getVar("PathOfTheBard_Event") == 1) then
        player:startEvent(2);

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.SONG_RUNES_DEFAULT);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:addGil(GIL_RATE*3000);
        player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*3000);
        player:addTitle(dsp.title.WANDERING_MINSTREL);
        player:unlockJob(dsp.job.BRD); -- Bard
        player:messageSpecial(ID.text.UNLOCK_BARD);  --You can now become a bard!
        player:setVar("PathOfTheBard_Event",0);
        player:addFame(JEUNO,30);
        player:completeQuest(JEUNO,dsp.quest.id.jeuno.PATH_OF_THE_BARD);
    end
end;
