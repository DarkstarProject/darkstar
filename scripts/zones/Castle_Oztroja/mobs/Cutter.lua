-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Cutter
-----------------------------------


-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
