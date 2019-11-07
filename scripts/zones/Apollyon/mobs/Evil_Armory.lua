-----------------------------------
-- Area: Apollyon SE
--  Mob: Evil Armory
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        GetNPCByID(ID.npc.APOLLYON_SE_CRATE[4]):setStatus(dsp.status.NORMAL)
    end
end
