-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Manifest_Idol
-----------------------------------
require("scripts/globals/status");
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
    
        local mobID = mob:getID();
    
    if (mobID == 16937264 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        --print("addtime 10min");
        mob:addInBattlefieldList();
    elseif (mobID == 16937262 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        --print("addtime 20min");
        mob:addInBattlefieldList();
    end
    
    
    
end;