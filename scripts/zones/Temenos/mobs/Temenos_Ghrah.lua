-----------------------------------
-- Area: Temenos
--  Mob: Temenos Ghrah
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    GetNPCByID(ID.npc.GATE_OFFSET+24):setStatus(dsp.status.NORMAL)
    battlefield:setLocalVar("cutsceneTimer", 10)
    battlefield:setLocalVar("lootSeen", 1)
end
