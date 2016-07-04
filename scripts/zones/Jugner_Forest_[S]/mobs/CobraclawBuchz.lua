-----------------------------------
-- Area: Jugner Forest [S]
--  MOB: Cobrawclaw Buchzvotch
-- Wrath of the Griffon Fight
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        player:needToZone(true);
        player:setVar("CobraClawKilled",1);
    end
end;