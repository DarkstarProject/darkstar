-----------------------------------
-- Area: Middle Delfutt's Tower
--  MOB: Gerwitz's Scythe
-- Involved In Quest: Blade of Evil
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_ACCEPTED) then
        ally:setVar("bladeOfEvilCS",1);
    end

end;