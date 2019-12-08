-----------------------------------
-- Area: Apollyon NE
--  Mob: Troglodyte Dhalmel
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local deadF2 = battlefield:getLocalVar("deadF2")
        battlefield:setLocalVar("deadF2", deadF2+1)
        if battlefield:getLocalVar("deadF2") == 7 then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[2]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[2]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[2]+2):setStatus(dsp.status.NORMAL)
        end
    end
end
