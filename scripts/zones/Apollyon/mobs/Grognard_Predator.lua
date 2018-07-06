-----------------------------------
-- Area: Apollyon CS
--  MOB: Grognard_Predator
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
require("scripts/globals/status");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_ORC);
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local helpers = GetServerVariable("deadHelpers");
    SetServerVariable("deadHelpers",helpers +1);
end;