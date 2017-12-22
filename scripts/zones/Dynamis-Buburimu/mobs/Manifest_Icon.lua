-----------------------------------
-- Area: Dynamis Buburimu
--  MOB: Manifest_Icon
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, BuburimuYagudoList);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    if ( mobID == 16941208 or mobID == 16941485) then
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
     elseif (mobID == 16941190 or mobID == 16941192 or 16941486) then
        player:messageBasic(msgBasic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    end
end;
