-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Lost_Soul
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getVar("EquipedforAllOccasions") == 1) then
        player:setVar("EquipedforAllOccasions",2);
    end
end;