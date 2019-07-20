-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Statue Prototype
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
-----------------------------------

function onMobInitialize(mob,target)
end;

function onMobDeath(mob, player, isKiller)

    local mobID = mob:getID();

    -- Time Bonus: 143 150
    if (mobID == 17330912 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    elseif (mobID == 17330919 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    end

end;