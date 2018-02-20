-----------------------------------
-- Area: Western Adoulin
--  NPC: Ruth
-- Type: Standard NPC and Quest NPC
--  Involved With Quest: 'A Pioneers Best (Imaginary) Friend'
--  @zone 256
--  !pos -144 4 -10 256
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local APBIF = player:getQuestStatus(ADOULIN, A_PIONEERS_BEST_IMAGINARY_FRIEND);
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((APBIF == QUEST_ACCEPTED) and (not player:hasStatusEffect(EFFECT_IONIS))) then
            -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(2523);
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(590);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(503);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2523) then
        -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
        player:addStatusEffect(EFFECT_IONIS, 0, 0, 9000);
    end
end;
