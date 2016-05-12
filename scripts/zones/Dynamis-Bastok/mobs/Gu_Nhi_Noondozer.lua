-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Nhi Noondozer
-- Time Extender: 30min
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

    if (alreadyReceived(player,4) == false) then
        player:addTimeToDynamis(30);
        addDynamisList(player,8);
    end

end;