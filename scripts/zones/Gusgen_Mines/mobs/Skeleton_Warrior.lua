-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Skeleton Warrior
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
    mob:addMod(MOD_CURE_POTENCY_RCVD,-25);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,679,1);
   checkGoVregime(killer,mob,680,2);
end;