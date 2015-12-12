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

function onMobDeath(mob, killer, ally)
    if (ally:getVar("EquipedforAllOccasions") == 1) then
        ally:setVar("EquipedforAllOccasions",2);
    end
end;