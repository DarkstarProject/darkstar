-----------------------------------
-- Area: Apollyon CS
--  MOB: Orc's Wyvern
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
-----------------------------------

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local helpers = GetServerVariable("deadHelpers");
    SetServerVariable("deadHelpers",helpers +1);
end;