-----------------------------------    
-- Area: Quicksand Caves
--  MOB: Tribunus_VII-I
-----------------------------------    

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

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17629661):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;