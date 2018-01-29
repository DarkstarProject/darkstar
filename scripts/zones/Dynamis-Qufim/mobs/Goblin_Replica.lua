-----------------------------------
-- Area: Dynamis qufim
--  MOB: Goblin Replica
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimGoblinList);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    if ( mobID == 16945528 or mobID == 16945538 or mobID == 16945546 ) then --hp
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        player:restoreHP(3000);
     elseif (mobID == 16945529 or mobID == 16945545) then --mp
        player:messageBasic(msgBasic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    end
end;
