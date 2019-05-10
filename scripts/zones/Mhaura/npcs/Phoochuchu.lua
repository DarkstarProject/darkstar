-----------------------------------
-- Area: Mhaura
--  NPC: Phoochuchu
-- Involved in Quest: A Thief in Norg!?
-- !pos -4 -4 69 249
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.A_THIEF_IN_NORG) == QUEST_ACCEPTED) then
        local aThiefinNorgCS = player:getVar("aThiefinNorgCS");
        if (aThiefinNorgCS == 2) then
            player:startEvent(301);
        elseif (aThiefinNorgCS == 3) then
            player:startEvent(303);
        elseif (aThiefinNorgCS >= 4) then
            player:startEvent(302);
        end
    else
        player:startEvent(300);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 301) then
        player:setVar("aThiefinNorgCS",3);
    end

end;