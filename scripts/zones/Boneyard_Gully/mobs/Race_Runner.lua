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

function onMobSpawn(mob)
    onMobRoam(mob);
end;

function onMobRoamAction(mob)

    dsp.path.patrol(mob, path, dsp.path.flag.REVERSE);

end;

function onMobRoam(mob)
    -- move to start position if not moving
    if (mob:isFollowingPath() == false) then
        mob:pathThrough(dsp.path.first(path));
    end
end;

function onMobDeath(mob, player, isKiller)
end;
