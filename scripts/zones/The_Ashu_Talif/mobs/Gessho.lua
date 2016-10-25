-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
-- MOB: Gessho
-- TOAU-15 Mission Battle
-----------------------------------

require("scripts/globals/allyassist");
require("scripts/globals/instance");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Gessho will engage by himself ~1min in if you stall too long.
    -- Give a little buffer for while the instance loads
    mob:timer(80000, function(mob)
        if(mob:getLocalVar("ready") == 0 and not(mob:getTarget())) then
            startAllyAssist(mob, ALLY_ASSIST_RANDOM);
        end
    end)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local ready = mob:getLocalVar("ready");

    -- Becomes Ready State 2 on 2nd Wave
    if(ready == 2) then
        mob:timer(60000, function(mob)
            if(mob:getLocalVar("ready") == 3 and not(mob:getTarget())) then
                startAllyAssist(mob, ALLY_ASSIST_RANDOM);
            end
        end)

        mob:setLocalVar("ready", 3);
    end

    -- When Gessho becomes ready via you pulling, he will assist you
    if (ready == 1) then
        startAllyAssist(mob, ALLY_ASSIST_PLAYER);
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
