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
	killer:setVar("DreadbugNM_Timer",VanadielDayOfTheYear());
	killer:setVar("NM_Spawned",0);
end;