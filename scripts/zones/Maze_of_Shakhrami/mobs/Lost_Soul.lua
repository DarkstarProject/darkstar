-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Lost Soul
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCharVar("EquippedforAllOccasions") == 1 then
        player:setCharVar("EquippedforAllOccasions", 2)
    end
end