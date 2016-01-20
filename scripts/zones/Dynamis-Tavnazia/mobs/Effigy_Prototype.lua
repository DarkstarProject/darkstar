-----------------------------------
-- Area: Dynamis tavnazia
--  MOB: Effigy_Prototype
-----------------------------------
require("scripts/globals/status");
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
    if (mobID == 16949272 and mob:isInBattlefieldList() == false) then
        ally:addTimeToDynamis(10);
        mob:addInBattlefieldList();
        --print("addtime 10min");
    end
end;