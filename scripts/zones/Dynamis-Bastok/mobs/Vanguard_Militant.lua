-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Militant
-----------------------------------

require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (mob:getID() == 17539301 and alreadyReceived(killer,6) == false) then
        ally:addTimeToDynamis(10);
        addDynamisList(killer,32);
    end

end;