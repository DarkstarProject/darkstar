-----------------------------------
-- Area: FeiYin
--  MOB: Droma
-----------------------------------
require("scripts/globals/groundsofvalor");
require("scripts/globals/keyitems");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,714,2);

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(dsp.kis.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(dsp.kis.SHANTOTTOS_NEW_SPELL);
        player:addKeyItem(dsp.kis.SHANTOTTOS_EXSPELL);
    end

end;