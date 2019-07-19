-----------------------------------
-- Area: Dynamis - Qufim
--  Mob: Avatar Idol
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();

    if (mobID == 16945243 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        --print("addtime 10min");
        mob:addInBattlefieldList();
    end

end;