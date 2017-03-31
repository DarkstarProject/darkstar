-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Raskovnik
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
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
    -- Soothing Aroma ONLY at 50% HP and below
    if (mob:getHPP() <=50) then
        mob:setMobMod(MOBMOD_SKILL_LIST, 805);
    else
        -- I'm assuming that if it heals up, it goes back to the other skill list.
        mob:setMobMod(MOBMOD_SKILL_LIST, 806);
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
