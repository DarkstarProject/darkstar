-----------------------------------
-- Area: Dynamis Tavnazia
--  NPC: Nightmare_Hornet

-----------------------------------
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, TavnaziaCloneList);
end;

function onMobDeath(mob, player, isKiller)

end;
