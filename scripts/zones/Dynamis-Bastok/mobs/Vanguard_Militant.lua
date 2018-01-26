-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Vanguard Militant
-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getID() == 17539301 and alreadyReceived(player,6) == false) then
        player:addTimeToDynamis(10);
        addDynamisList(player,32);
    end
end;
