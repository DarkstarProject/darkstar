-----------------------------------
-- mob : Fomor Mahisha
-- zone : Phomiuna_Aqueducts
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	local kills = killer:getVar("FOMOR_HATE");
	if (kills > 1) then
		killer:setVar("FOMOR_HATE",kills -2);
	end
end;