-----------------------------------
-- Area: Boneyard_Gully
-- Name: Race Runner
-----------------------------------
require("scripts/globals/pathfind");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

local path =
{
    -539, 0, -481,
    -556, 0, -478,
    -581, 0, -475,
    -579, -3, -460,
    -572, 2, -433,
    -545, 1, -440,
    -532, 0, -466
};

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    onMobRoam(mob);
end;

function onMobRoamAction(mob)

    pathfind.patrol(mob, path, PATHFLAG_REVERSE);

end;

function onMobRoam(mob)
    -- move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(pathfind.first(path));
    end
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;
