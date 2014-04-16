-----------------------------------
-- Area: Al'Taieu
-- NPC:  Ul'Hpemde
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    if (math.random(0,1) == 0) then
        mob:hideName(true);
        mob:untargetable(true);
        mob:AnimationSub(5);
    else
        mob:hideName(false);
        mob:untargetable(false);
        mob:AnimationSub(6);
    end
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;