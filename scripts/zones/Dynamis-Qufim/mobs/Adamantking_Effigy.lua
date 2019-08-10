-----------------------------------
-- Area: Dynamis - Qufim
--  Mob: Adamantking Effigy

-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, QufimQuadavList);
end;

function onMobDeath(mob, player, isKiller)

    -- local mobID = mob:getID();


end;
