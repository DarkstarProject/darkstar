-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  MOB: Ashu Talif Crew
-----------------------------------

local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setUnkillable(true);
end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local disengage = mob:getLocalVar("disengage");

    -- The captain gives up at <= 20% HP. Everyone disengages
    if (mob:getHPP() <= 20 and disengage == 0) then
        local instance = mob:getInstance();

        -- Give disengage time to happen
        mob:timer(7500, function(mob)
            local instance = mob:getInstance();
            instance:setProgress(instance:getProgress() + 10);
        end)

        -- Time to give up, let's disengage
        local mobs = mob:getInstance():getMobs();
        instance:disengageAll();

        mob:setLocalVar("disengage", 1);
    end

end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local disengage = mob:getLocalVar("disengage");
    local disengageTime = mob:getLocalVar("disengageTime")
    local jumped = mob:getLocalVar("jump");
    local ready = mob:getLocalVar("ready");

    -- Becomes ready when the Crew is engaged. Jump down!
    if (ready == 1 and jumped == 0) then
        mob:hideName(true);
        mob:entityAnimationPacket("jmp0");

        mob:timer(2000, function(mob)
            mob:setPos(0,-22,13,192);
            mob:entityAnimationPacket("jmp1");
            mob:timer(2000, function(mob)
                mob:hideName(false);
                mob:untargetable(false);
            end)
        end)

        mob:setLocalVar("jump", 1);
    end

end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
