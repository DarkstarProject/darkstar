-----------------------------------
-- Area: Bastok Markets
--  NPC: Biggorf
-- Standard Info NPC
-- Involved in Quest: The Bare Bones
-----------------------------------
require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);

    if (BareBones == QUEST_ACCEPTED) then
        player:startEvent(257);
    else
        player:startEvent(126);
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