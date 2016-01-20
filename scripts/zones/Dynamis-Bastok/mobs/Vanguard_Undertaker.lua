-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  SMN Vanguard Undertaker + Vanguard's Avatar
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    DespawnMob(mob:getID() + 1);
end;