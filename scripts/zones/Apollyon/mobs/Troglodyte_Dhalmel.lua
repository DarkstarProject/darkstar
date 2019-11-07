-----------------------------------
-- Area: Apollyon NE
--  Mob: Troglodyte Dhalmel
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local allDead = true
        for i = 2, 9 do
            if GetMobByID(ID.mob.APOLLYON_NE_MOB[5]+i):isAlive() then
                allDead = false
            end
        end
        if allDead then
            GetNPCByID(ID.npc.APOLLYON_NE_CRATE[5]):setStatus(dsp.status.NORMAL)
        end
    end
end
