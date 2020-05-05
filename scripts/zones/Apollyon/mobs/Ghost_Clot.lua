-----------------------------------
-- Area: Apollyon SE
--  Mob: Ghost Clot
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.SLASHRES, 1500)
    mob:setMod(dsp.mod.HTHRES, 0)
    mob:setMod(dsp.mod.IMPACTRES, 0)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[1])
    end
end