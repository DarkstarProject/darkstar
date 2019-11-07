-----------------------------------
-- Area: Apollyon SE
--  Mob: Flying Spear
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("killCountF4", battlefield:getLocalVar("killCountF4")+1)
        local killCount = battlefield:getLocalVar("killCountF4")
        if killCount == 1 then
            GetNPCByID(ID.mob.APOLLYON_SE_MOB[4]):setStatus(dsp.status.DISAPPEAR)      
            GetMobByID(ID.mob.APOLLYON_SE_MOB[4]):spawn()
        end
    end
end
