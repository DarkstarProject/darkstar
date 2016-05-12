-----------------------------------
-- Area: Dynamis qufim
--  MOB: Goblin_Statue
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

function onMobDeath(mob, player, isKiller)
local mobID = mob:getID();
    if (mobID == 16945509 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
        --print("addtime 10min");
    elseif (mobID == 16945530 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
        --print("addtime 20min");
    end
end;