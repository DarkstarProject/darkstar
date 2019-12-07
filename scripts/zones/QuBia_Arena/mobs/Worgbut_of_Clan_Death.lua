-----------------------------------
-- Area: QuBia_Arena
--  Mob: Worgbut of Clan Death
-- Mission 9-2 SANDO
-----------------------------------
local ID = require("scripts/zones/QuBia_Arena/IDs")

function allHeirMobsDead(player)
    local inst = player:getBattlefield():getArea()
    local instOffset = ID.mob.HEIR_TO_THE_LIGHT_OFFSET + (14 * (inst-1))
    for i = instOffset + 3, instOffset + 13 do
        if not GetMobByID(i):isDead() then
            return false
        end
    end
    return true
end

function onMobDeath(mob, player, isKiller)
    if allHeirMobsDead(player) then
        player:release() -- prevents event collision if player kills multiple remaining mobs with an AOE move/spell
        player:startEvent(32004,0,0,4)
    end
end
