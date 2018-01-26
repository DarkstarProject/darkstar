-----------------------------------
-- Area: Dynamis tavnazia
--  MOB: Icon_Prototype
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
local mobID = mob:getID();

    if (mobID == 16949306 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        --print("addtime 10min");
        mob:addInBattlefieldList();
    end

end;