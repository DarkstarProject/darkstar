-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Nhi Noondozer
-- Time Extender: 30min
-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)

    if (alreadyReceived(player,4) == false) then
        player:addTimeToDynamis(30);
        addDynamisList(player,8);
    end

end;