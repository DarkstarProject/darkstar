-----------------------------------
-- Area: Temenos N T
--  Mob: Cryptonberry Charmer
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobEngaged(mob, target)
end

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    player:messageSpecial(ID.text.GATE_OPEN)
    player:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
    GetNPCByID(ID.npc.GATE_OFFSET+5):setStatus(dsp.status.NORMAL)
end
