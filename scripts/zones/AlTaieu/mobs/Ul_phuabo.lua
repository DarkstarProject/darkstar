-----------------------------------
-- Area: Al'Taieu
--  MOB: Ul'Phuabo
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
    mob:wait(2000);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
    mob:wait(2000);
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
	mob:hideName(true);
	mob:untargetable(true);
	mob:AnimationSub(5);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
end;