-----------------------------------
-- Area: Castle Zvahl Baileys
--  MOB: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:setVar("BorghertzSparkKilled",1);
end;