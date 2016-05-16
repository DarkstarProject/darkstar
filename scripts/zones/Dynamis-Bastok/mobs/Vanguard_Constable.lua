-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Constable
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

    if (mob:getID() == 17539304 and alreadyReceived(player,5) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,16);
    end

end;