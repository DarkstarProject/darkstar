-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Adamantking Effigy

-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, BuburimuQuadavList);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    if (mobID ==16941457) then
        player:messageBasic(dsp.msg.basic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
        player:restoreMP(3000);
    end
end;
