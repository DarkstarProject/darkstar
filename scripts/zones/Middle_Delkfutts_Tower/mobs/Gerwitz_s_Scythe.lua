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

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_ACCEPTED) then
        player:setVar("bladeOfEvilCS",1);
    end

end;