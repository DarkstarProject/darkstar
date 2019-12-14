-----------------------------------
-- Area: Apollyon NW
--  Mob: Bardha
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF1 = battlefield:getLocalVar("randomF1")
        if mobID == randomF1 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            battlefield:setLocalVar("randomF2", ID.mob.APOLLYON_NW_MOB[2]+math.random(1,8))
            GetNPCByID(ID.npc.APOLLYON_NW_PORTAL[1]):setAnimation(8)
        end
    end
end
