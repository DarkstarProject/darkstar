-----------------------------------
-- Area: West Sarutabaruta [S]
--   NM: Orcus
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ORCUS_TROPHY_HUNTER)
end
