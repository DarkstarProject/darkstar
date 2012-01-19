require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setVar("NM",1);
	killer:setVar("NM_Timer",os.time());
end;