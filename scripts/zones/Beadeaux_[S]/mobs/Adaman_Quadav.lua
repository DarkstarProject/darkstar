-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Adaman Quadav
-- Note: PH for Ea'Tho Cruelheart and Ba'Tho Mercifulheart
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.EATHO_CRUELHEART_PH, 10, 7200) -- 2 hours
    dsp.mob.phOnDespawn(mob, ID.mob.BATHO_MERCIFULHEART_PH, 10, 7200) -- 2 hours
end
