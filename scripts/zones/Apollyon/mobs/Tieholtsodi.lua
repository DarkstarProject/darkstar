-----------------------------------
-- Area: Apollyon SE
--  Mob: Tieholtsodi
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/pathfind")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")
local flags = dsp.path.flag.WALLHACK
local path =
{
        {149.587, -0.293, -526.395},
        {145.010, 0.000, -438.159}
}

function onMobRoam(mob)
    local pause = mob:getLocalVar("pause")
    if pause < os.time() then
        local point = (mob:getLocalVar("point") % 2)+1
        mob:setLocalVar("point", point)
        mob:pathTo(path[point][1], path[point][2], path[point][3], flags)
        mob:setLocalVar("pause", os.time()+40)
    end
end

function onMobSpawn(mob)
    mob:setMod(dsp.mod.SLASHRES, 0)
    mob:setMod(dsp.mod.PIERCERES, 1500)
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.HUNDRED_FISTS, hpp = 50},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[2])
    end
end