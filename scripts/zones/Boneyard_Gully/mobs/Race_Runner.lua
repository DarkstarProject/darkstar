-----------------------------------
-- Area: Boneyard Gully
--  Mob: Race Runner
--  ENM: Like the Wind
-----------------------------------
require("scripts/globals/pathfind")
require("scripts/globals/status")
require("scripts/globals/titles")
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
}

function onMobSpawn(mob)
    onMobRoam(mob)
end

function onMobRoamAction(mob)
    dsp.path.patrol(mob, path, dsp.path.flag.REVERSE)
end

function onMobRoam(mob)
    if not mob:isFollowingPath() then
        mob:pathThrough(dsp.path.first(path))
    end
end

function onMobDeath(mob, player, isKiller)
end
