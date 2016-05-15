-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Adamantking_Image
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
    if (mobID == 16937239 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(10);
        mob:addInBattlefieldList();
    elseif (mobID == 16937237 and  mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    end
end;