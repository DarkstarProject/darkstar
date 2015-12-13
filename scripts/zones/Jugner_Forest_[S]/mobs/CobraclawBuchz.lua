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

function onMobDeath(mob,killer,ally)
    if (ally:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        ally:needToZone(true);
        ally:setVar("CobraClawKilled",1);
    end
end;