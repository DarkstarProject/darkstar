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

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == 17539301 and alreadyReceived(player,6) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,32);
    end
end;
