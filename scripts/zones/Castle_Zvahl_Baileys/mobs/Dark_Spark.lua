-----------------------------------
-- Area: Castle Zvahl Baileys
--  MOB: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("BorghertzSparkKilled",1);
end;