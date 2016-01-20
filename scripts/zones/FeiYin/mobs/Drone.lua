-----------------------------------
-- Area: FeiYin
--  MOB: Drone
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

function onMobDeath(mob, killer, ally)

    checkGoVregime(ally,mob,711,2);

    -- Curses, Foiled A-Golem!?
    if (ally:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
        ally:delKeyItem(SHANTOTTOS_NEW_SPELL);
        ally:addKeyItem(SHANTOTTOS_EXSPELL);
    end

end;