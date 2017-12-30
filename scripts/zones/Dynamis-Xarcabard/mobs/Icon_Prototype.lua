-----------------------------------
-- Area: Dynamis Xarcabard
--  MOB: Icon Prototype
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
    
    -- Time Bonus: 043
    if (mobID == 17330814 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- HP Bonus: 052
    elseif (mobID == 17330533) then
        player:restoreHP(2000);
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
    -- HP Bonus: 073
    elseif (mobID == 17330843) then
        player:restoreMP(2000);
        player:messageBasic(msgBasic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
    end
    
end;
