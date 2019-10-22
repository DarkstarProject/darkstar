-----------------------------------
-- Area: Temenos
--  Mob: Temenos Ghrah
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local battlefield = player:getBattlefield()
    players = battlefield:getPlayers()
    for i = 1, #players do
        players[i]:messageSpecial(ID.text.HUM+1)
    end
    GetNPCByID(ID.npc.GATE_OFFSET+25):setStatus(dsp.status.NORMAL)
    battlefield:setLocalVar("cutsceneTimer", 10)
    battlefield:setLocalVar("dontKick", 0)
end
