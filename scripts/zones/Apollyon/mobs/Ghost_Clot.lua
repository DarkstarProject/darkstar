-----------------------------------
-- Area: Apollyon SE
--  Mob: Ghost Clot
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.SLASHRES, 1500)
    mob:setMod(dsp.mod.HTHRES, 0)
    mob:setMod(dsp.mod.IMPACTRES, 0)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local players = battlefield:getPlayers()
        for i, member in pairs(players) do
            member:messageSpecial(ID.text.GATE_OPEN)
            member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        end
    end
end