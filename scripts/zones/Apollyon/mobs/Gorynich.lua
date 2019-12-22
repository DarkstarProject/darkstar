-----------------------------------
-- Area: Apollyon NW
--  Mob: Gorynich
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF4 = battlefield:getLocalVar("randomF4")
        if mobID == randomF4 then
            dsp.limbus.handleDoors(battlefield, true, ID.npc.APOLLYON_NW_PORTAL[4])
        end
    end
end