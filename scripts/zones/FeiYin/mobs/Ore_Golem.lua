-----------------------------------
-- Area: FeiYin
-- MOB:  Ore Golem
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    checkGoVregime(killer,mob,712,2);

    -- Curses, Foiled A-Golem!?
    if (killer:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
        killer:delKeyItem(SHANTOTTOS_NEW_SPELL);
        killer:addKeyItem(SHANTOTTOS_EXSPELL);
    end

end;