-----------------------------------
-- Area: Boneyard Gully
-- NPC:  Swift_Hunter
-- ID:     16810002
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setTP(100);
    mob:setMobMod(MOBMOD_SUPERLINK,0);
    mob:speed(0);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------
function onMobEngaged(mob, target)
    mob:useMobAbility(22); -- Pit Ambush
end;

-----------------------------------
-- onMobWeaponSkill
-----------------------------------

function onMobWeaponSkill(mob, target)
    mob:speed(40);
    mob:untargetable(false);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;
