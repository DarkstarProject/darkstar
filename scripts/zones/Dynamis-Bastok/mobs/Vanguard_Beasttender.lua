-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Beasttender + Vanguard's Scorpion
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

function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID() + 1);
end;