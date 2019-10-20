-----------------------------------
-- Area: Temenos
--  Mob: Temenos Ghrah
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    GetNPCByID(16928770+475):setStatus(dsp.status.NORMAL)
    battlefield:setLocalVar("cutsceneTimer", 10)
    battlefield:setLocalVar("lootSeen", 1)
end
