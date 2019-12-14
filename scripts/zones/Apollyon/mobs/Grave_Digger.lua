-----------------------------------
-- Area: Apollyon SE
--  Mob: Grave Digger
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.HTHRES, 1500)
    mob:setMod(dsp.mod.IMPACTRES, 1500)
    mob:setMod(dsp.mod.PIERCERES, 0)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local battlefield = player:getBattlefield()
        local players = battlefield:getPlayers()
        for i, member in pairs(players) do
            member:messageSpecial(ID.text.GATE_OPEN)
            member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
        end
        GetNPCByID(ID.npc.APOLLYON_SE_PORTAL[3]):setAnimation(8)
    end
end