-----------------------------------
-- Area: Xarcabard
--  Mob: Koenigstiger
-- Involved in Quests: Unbridled Passion (RNG AF3)
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("unbridledPassion") == 4 then
        player:setVar("unbridledPassion", 5)
    end
end