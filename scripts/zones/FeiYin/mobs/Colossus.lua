-----------------------------------
-- Area: FeiYin
--  Mob: Colossus
-- Note: PH for Goliath
-----------------------------------
local ID = require("scripts/zones/FeiYin/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 715, 2, dsp.regime.type.GROUNDS)

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(dsp.ki.SHANTOTTOS_EXSPELL)
    end
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.GOLIATH_PH, 10, 3600) -- 1 hour
end
