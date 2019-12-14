-----------------------------------
-- Area: Apollyon NE
--  Mob: Hyperion
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(dsp.mod.UDMGMAGIC, -100)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF4 = battlefield:getLocalVar("randomF4")
        if randomF4 == mobID then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.APOLLYON_NE_PORTAL[4]):setAnimation(8)
        end
    end
end