-----------------------------------
-- Area: Windurst Woods
--  NPC: Gottah Maporushanoh
-- Working 100%
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);

    if (AmazinScorpio == QUEST_COMPLETED) then
        player:startEvent(486);
    elseif (AmazinScorpio == QUEST_ACCEPTED) then
        player:startEvent(483);
    else
        player:startEvent(420);
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



