-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Effigy Prototype
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/msg");

function onMobInitialize(mob,target)
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();

    -- HP Bonus: 112 142
    if (mobID == 17330532 or mobID == 17330911) then
        player:restoreHP(2000);
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
    end
end;
