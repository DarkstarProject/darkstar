-----------------------------------
-- Area: Abyssea-Konschtat
--  Mob: Lachrymater
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob,target)
    local DayofWeek = VanadielDayElement();

    mob:setSpellList(188 + DayofWeek);

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;