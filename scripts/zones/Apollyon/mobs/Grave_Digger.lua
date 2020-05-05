-----------------------------------
-- Area: Apollyon SE
--  Mob: Grave Digger
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.HTHRES, 1500)
    mob:setMod(dsp.mod.IMPACTRES, 1500)
    mob:setMod(dsp.mod.PIERCERES, 0)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        dsp.limbus.handleDoors(player:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[3])
    end
end