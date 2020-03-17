-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Dark Spark
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if
        player:getCharVar("BorghertzSparkKilled") == 0 and
        player:hasKeyItem(tpz.ki.OLD_GAUNTLETS) and
        not player:hasKeyItem(tpz.ki.SHADOW_FLAMES) and
        player:getCharVar("BorghertzCS") >= 2
    then
        player:setCharVar("BorghertzSparkKilled", 1)
    end
end