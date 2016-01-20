-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Vindicator
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

    if (mob:getID() == 17539300 and alreadyReceived(killer,7) == false) then
        ally:addTimeToDynamis(10);
        addDynamisList(killer,64);
    end

end;