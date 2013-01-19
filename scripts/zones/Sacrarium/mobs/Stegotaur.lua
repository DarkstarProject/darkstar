
-----------------------------------
-- Stegotaur
-----------------------------------




-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	kills = killer:getVar("FOMOR_HATE");
	if(kills > 4) then
		killer:setVar("FOMOR_HATE",kills -4);
	end
end;