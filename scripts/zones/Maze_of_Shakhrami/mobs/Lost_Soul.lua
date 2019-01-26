-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Lost_Soul
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getVar("EquippedforAllOccasions") == 1) then
        player:setVar("EquippedforAllOccasions",2);
    end
end;