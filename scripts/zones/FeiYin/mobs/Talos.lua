-----------------------------------
-- Area: FeiYin
--  Mob: Talos
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/keyitems");
-----------------------------------

function onMobDeath(mob, player, isKiller)

    dsp.regime.checkRegime(player, mob, 713, 2, dsp.regime.type.GROUNDS)
    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL);
        player:addKeyItem(dsp.ki.SHANTOTTOS_EXSPELL);
    end

end;