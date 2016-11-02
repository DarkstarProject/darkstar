-----------------------------------
--  Area: Abyssea - La Theine
--   Mob: Hadhayosh
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_UFASTCAST, 150); -- For instant cast Meteor at low HP
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    -- First Meteor Spell cast at 20%.
    if (mob:getHPP() <=20 and mob:getLocalVar("meteorCount") == 0) then
        mob:setLocalVar("meteorCount", 1);
    -- https://www.youtube.com/results?search_query=Hadhayosh+ffxi
        mob:castSpell(218);
    -- Second Meteor Spell cast at 5%
    elseif (mob:getHPP() <= 5 and mob:getLocalVar("meteorCount") == 1) then
        mob:setLocalVar("meteorCount", 2);
        mob:castSpell(218);
    end;
end;

------------------------------------
-- onSpellPrecast
------------------------------------

function onSpellPrecast(mob, spell)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
