-----------------------------------
-- Area: Dynamis tavnazia
--  MOB: Prototype_Eye
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
    if (mobID == 16949380 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        --print("addtime 20min");
        mob:addInBattlefieldList();
    end

end;