-----------------------------------
-- Area: Caedarva Mire
--  MOB: Jazaraat
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:setVar("AhtUrganStatus",2);
end;
