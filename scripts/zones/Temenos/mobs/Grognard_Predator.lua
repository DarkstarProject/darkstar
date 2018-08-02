-----------------------------------
-- Area: Central Temenos
--  MOB: Grognard_Predator
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temenos/TextIDs");
require("scripts/globals/limbus");
require("scripts/globals/status");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_ORC);
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;