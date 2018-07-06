-----------------------------------
-- Area: Apollyon CS
--  MOB: Wootz_Quadav
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
    local helpers = GetServerVariable("deadQuadHelpers");
    SetServerVariable("deadQuadHelpers",helpers +1);
end;