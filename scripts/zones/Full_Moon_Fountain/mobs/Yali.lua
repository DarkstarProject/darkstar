-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Yali
-- Windurst Mission 9-2
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")

function onMobInitialize(mob)
    mob:setSpellList(135)
end

function onMobDeath(mob, player, isKiller)
    local inst = mob:getBattlefield():getArea()
    local instOffset = ID.mob.MOON_READING_OFFSET + (6 * (inst - 1))
    if GetMobByID(instOffset + 4):isDead() and GetMobByID(instOffset + 5):isDead() then
        mob:getBattlefield():setLocalVar("loot", 0)
    end
end
