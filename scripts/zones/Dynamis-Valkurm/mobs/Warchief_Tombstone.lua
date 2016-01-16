-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Warchief_Tombstone
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
local mobID = mob:getID();
    if (mobID == 16937214 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(10);
        mob:addInBattlefieldList();
        --print("addtime 10min");
    elseif (mobID == 16937212 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(20);
        mob:addInBattlefieldList();
        --print("addtime 20min");
    end
end;