-----------------------------------
-- Area: Dynamis tavnazia
--  MOB: Tombstone_Prototype
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

function onMobDeath(mob, player, isKiller)
local mobID = mob:getID();
    if (mobID == 16949292 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
        --print("addtime 10min");
    end
end;