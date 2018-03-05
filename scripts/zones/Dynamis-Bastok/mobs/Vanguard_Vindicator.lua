-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Vindicator
-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == 17539300 and alreadyReceived(player,7) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,64);
    end
end;
