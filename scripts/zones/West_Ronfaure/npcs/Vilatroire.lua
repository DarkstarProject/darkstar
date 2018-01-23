-----------------------------------
-- Area: West Ronfaure
--  NPC: Vilatroire
-- Involved in Quests: "Introduction To Teamwork", "Intermediate Teamwork",
-- "Advanced Teamwork"
-- !pos -260.361 -70.999 423.420 100
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    --player:startEvent(131); -- Same job
    --player:startEvent(133); -- Same race
    local intermedTmwrk = player:getQuestStatus(SANDORIA,INTRODUCTION_TO_TEAMWORK);
    local sFame = player:getFameLevel(SANDORIA);
    if (intermedTmwrk == QUEST_AVAILABLE and sFame >= 2) then
        player:startEvent(135); -- Starts first quest - 6 members same alliance
    elseif (intermedTmwrk == QUEST_ACCEPTED) then
        player:startEvent(134); -- You don't have the requirements to finish
    else
        player:startEvent(136); -- Default - before quests
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;
