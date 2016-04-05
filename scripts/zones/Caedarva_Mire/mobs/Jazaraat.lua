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

function onMobDeath(mob, killer, ally)
    ally:setVar("AhtUrganStatus",2);
end;
