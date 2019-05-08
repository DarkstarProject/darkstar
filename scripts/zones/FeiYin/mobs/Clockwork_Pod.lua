-----------------------------------
-- Area: FeiYin
--  MOB: Clockwork Pod
-- Note: PH for Mind Hoarder
-----------------------------------
local ID = require("scripts/zones/FeiYin/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Curses, Foiled A-Golem!?
    if player:hasKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL) then
        player:delKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(dsp.ki.SHANTOTTOS_EXSPELL)
    end
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.DONNERGUGI_PH, 10, 3600) -- 1 hour
end
