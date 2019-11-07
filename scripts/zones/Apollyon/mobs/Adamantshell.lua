-----------------------------------
-- Area: Apollyon SE
--  Mob: Adamantshell
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        battlefield:setLocalVar("killCountF2", battlefield:getLocalVar("killCountF2")+1)
        local killCount = battlefield:getLocalVar("killCountF2")
        if killCount == 2 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[2]):setStatus(dsp.status.NORMAL)
        elseif killCount == 4 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[2]+1):setStatus(dsp.status.NORMAL)
        elseif killCount == 8 then
            GetNPCByID(ID.npc.APOLLYON_SE_CRATE[2]+2):setStatus(dsp.status.NORMAL)        
        end
    end
end
