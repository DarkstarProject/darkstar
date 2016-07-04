-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Lost_Soul
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getVar("EquipedforAllOccasions") == 1) then
        player:setVar("EquipedforAllOccasions",2);
    end
end;