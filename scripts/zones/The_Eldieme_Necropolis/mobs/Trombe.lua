-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB:  Trombe
-- Involved in Quest: A New Dawn (BST AF3)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.CHARMABLE, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobDeath(mob, player, isKiller)
end 