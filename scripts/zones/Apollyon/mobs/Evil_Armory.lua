-----------------------------------
-- Area: Apollyon SE
--  Mob: Evil Armory
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.UDMGMAGIC, -100)
    mob:setMod(dsp.mod.UDMGPHYS, -80)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        GetNPCByID(ID.npc.APOLLYON_SE_CRATE[4]):setStatus(dsp.status.NORMAL)
    end
end
