-----------------------------------
-- Area: Fei'Yin
--  NM:  Jenglot
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    -- Curses, Foiled A-Golem!?
    if (ally:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
        ally:delKeyItem(SHANTOTTOS_NEW_SPELL);
        ally:addKeyItem(SHANTOTTOS_EXSPELL);
    end
end;