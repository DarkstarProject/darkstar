-----------------------------------
-- Area: Dynamis Valkurm
-- MOB: Manifest_Idol
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
local text = require("scripts/zones/Dynamis-Valkurm/TextIDs");

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
    
        local mobID = mob:getID();
    
    if (mobID == 16937264 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(10);
        --print("addtime 10min");
        mob:addInBattlefieldList();
    elseif (mobID == 16937262 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(20);
        --print("addtime 20min");
        mob:addInBattlefieldList();
    end
    
    
    
end;