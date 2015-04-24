-----------------------------------
-- Area: Boneyard_Gully
-- Name: Race Runner
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

local path = {
    -539, 0, -481,
    -556, 0, -478,
    -581, 0, -475,
    -579, -3, -460,
    -572, 2, -433,
    -545, 1, -440,
    -532, 0, -466,
    -535, 0, -482,
    -547, 1, -486
};

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onPath(mob)
    pathfind.patrol(mob, path);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    onMobRoam(mob);
end;

-----------------------------------
-- onMobRoamAction Action
-----------------------------------

function onMobRoamAction(mob)
    pathfind.patrol(mob, path, PATHFLAG_REVERSE);
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    -- move to start position if not moving
    if(mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path));
    end
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;