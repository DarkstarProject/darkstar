-----------------------------------
-- Area: Jugner Forest [S]
--  MOB: Cobrawclaw Buchzvotch
-- Wrath of the Griffon Fight
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        player:needToZone(true);
        player:setVar("CobraClawKilled",1);
    end
end;