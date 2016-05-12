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
    -532, 0, -466
};

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
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
    if (mob:isFollowingPath() == false) then
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

function onMobDeath(mob, player, isKiller)
end;