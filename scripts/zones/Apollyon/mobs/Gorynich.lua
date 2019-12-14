-----------------------------------
-- Area: Apollyon NW
--  Mob: Gorynich
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        local mobID = mob:getID()
        local battlefield = player:getBattlefield()
        local randomF4 = battlefield:getLocalVar("randomF4")
        if mobID == randomF4 then
            local players = battlefield:getPlayers()
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
            GetNPCByID(ID.npc.APOLLYON_NW_PORTAL[4]):setAnimation(8)
        end
    end
end