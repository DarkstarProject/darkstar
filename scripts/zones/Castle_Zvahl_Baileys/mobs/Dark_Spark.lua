-----------------------------------
-- Area: Castle Zvahl Baileys
--  MOB: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- @zone 161
-- @pos 63 -24 21
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, player, isKiller)
    player:setVar("BorghertzSparkKilled",1);
end;