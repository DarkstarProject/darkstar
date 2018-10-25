-----------------------------------
-- Area: Palborough Mines
--  NPC: Old Toolbox
-- Continues Quest: The Eleventh's Hour
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.OLD_TOOLBOX) == false) then
        player:startEvent(23);
    else
        player:startEvent(22);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

    if (csid == 23 and option == 0) then
        player:addKeyItem(dsp.ki.OLD_TOOLBOX);
    end

end;

function onEventFinish(player,csid,option)
end;