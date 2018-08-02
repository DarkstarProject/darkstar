-----------------------------------
-- Area: Apollyon CS
--  MOB: Grognard_Neckchopper
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local helpers = GetServerVariable("deadHelpers");
    SetServerVariable("deadHelpers",helpers +1);
end;