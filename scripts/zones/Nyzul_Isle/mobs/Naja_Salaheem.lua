-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
-- MOB: Naja Salaheem
-----------------------------------

require("scripts/globals/allyassist");
require("scripts/globals/instance");
require("scripts/zones/Nyzul_Isle/IDs");

-- Path to Stage 2 Position
local stage2Position = {
    499, 0, -531,
    500, 0, -509,
}

-- Path to Stage 3 Position
local stage3Position = {
    490, 0, -500,
    473, 0, -499,
    473, 0, -486,
    459, 0, -486,
    460, 0, -446,
}

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobDisengaged Action
-----------------------------------

function onMobDisengaged(mob, target)
    local ready = mob:getLocalVar("ready");

    if (ready == 1) then
        startAllyAssist(mob, ALLY_ASSIST_RANDOM);
    end
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    -- Advance to Stage 2 area
    if (mob:getLocalVar("Stage") == 2) then
        mob:pathThrough(stage2Position, PATHFLAG_SCRIPT);
        mob:setMobMod(MOBMOD_NO_MOVE, 1);
    -- Advance to Stage 3 area
    elseif (mob:getLocalVar("Stage") == 3) then
        mob:pathThrough(stage3Position, PATHFLAG_SCRIPT);
        mob:setMobMod(MOBMOD_NO_MOVE, 1);
    end

    -- Ally Assist Check
    local ready = mob:getLocalVar("ready");

    -- Only start the path once
    if (mob:isFollowingPath()) then
        mob:setLocalVar("Stage",0);
    -- Path must finish before Ally Asisst (no wallhacking!)
    elseif (ready == 1) then
        mob:setMobMod(MOBMOD_NO_MOVE, 0);
        startAllyAssist(mob, ALLY_ASSIST_RANDOM);
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
    -- Signal loss if Naja dies. Disengage everyone while failure message plays
    local instance = mob:getInstance();
    disengageAll(instance);

    local chars = instance:getChars();

    for i,v in pairs(chars) do
        v:messageSpecial(NyzulIsle.text.MISSION_FAILED,10,10);
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Fail out as she despawns
    local instance = mob:getInstance();
    instance:fail();
end;
