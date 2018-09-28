-----------------------------------
-- Area: Abyssea-Konschtat
--  Mob: Lachrymater
-----------------------------------

function onMobSpawn(mob,target)
    local DayofWeek = VanadielDayElement();

    mob:setSpellList(188 + DayofWeek);

end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;