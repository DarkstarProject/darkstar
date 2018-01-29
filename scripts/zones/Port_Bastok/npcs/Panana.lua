-----------------------------------
-- Area: Port Bastok
--  NPC: Panana
-- Involved in Quest: Out of One's Shell
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    OutOfOneShell = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);

    if (OutOfOneShell == QUEST_ACCEPTED and player:getVar("OutOfTheShellZone") == 0) then
        player:startEvent(83);
    else
        player:startEvent(43);
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