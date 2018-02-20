-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Lich_C_Magnus
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(LICH_BANISHER);
    if (player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
        player:setVar("Lich_C_Magnus_Died",1);
    end
end;