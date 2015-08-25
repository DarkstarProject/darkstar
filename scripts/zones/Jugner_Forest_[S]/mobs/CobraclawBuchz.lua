-----------------------------------
-- Area: Jugner Forest [S]
-- NPC:  Cobrawclaw Buchzvotch
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

function onMobDeath(mob,killer)

    if (killer:getQuestStatus(CRYSTAL_WAR, WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        killer:needToZone(true);
        killer:setVar("CobraClawKilled",1);
    end

end;