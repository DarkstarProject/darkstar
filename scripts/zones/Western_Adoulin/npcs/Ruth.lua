-----------------------------------
--  Area: Western Adoulin
--  NPC: Ruth
--  Type: Standard NPC and Quest NPC
--  Involved With Quest: 'A Pioneers Best (Imaginary) Friend'
--  @zone 256
-- @pos -44 4 -10
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local APBIF = player:getQuestStatus(ADOULIN, A_PIONEERS_BEST_IMAGINARY_FRIEND);
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        if ((APBIF == QUEST_ACCEPTED) and (not player:hasStatusEffect(EFFECT_IONIS))) then
            -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(0x09DB);
        else
            -- Standard dialogue, after joining colonization effort
            player:startEvent(0x024E);
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x01F7);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)    
    if (csid == 0x09DB) then
        -- Progresses Quest: 'A Pioneers Best (Imaginary) Friend'
        player:addStatusEffect(EFFECT_IONIS, 0, 0, 9000);
    end
end;
