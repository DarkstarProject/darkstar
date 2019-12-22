-----------------------------------
-- Area: Apollyon SE
--  Mob: Tieholtsodi
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Apollyon/IDs")

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