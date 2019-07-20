-----------------------------------
-- Area: Xarcabard
--  Mob: Koenigstiger
-- Involved in Quests: Unbridled Passion (RNG AF3)
-- !zone 112
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local UnbridledPassionCS = player:getVar("unbridledPassion")

    if UnbridledPassionCS == 4 then
        player:setVar("unbridledPassion", 5)
    end
end