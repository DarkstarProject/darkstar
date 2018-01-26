-----------------------------------
-- Area: Fei'Yin
--  NM:  Jenglot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(SHANTOTTOS_NEW_SPELL);
        player:addKeyItem(SHANTOTTOS_EXSPELL);
    end
end;