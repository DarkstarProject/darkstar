-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Prototype Eye
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
-----------------------------------

function onMobDeath(mob, player, isKiller)
local mobID = mob:getID();
    if (mobID == 16949380 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        --print("addtime 20min");
        mob:addInBattlefieldList();
    end

end;