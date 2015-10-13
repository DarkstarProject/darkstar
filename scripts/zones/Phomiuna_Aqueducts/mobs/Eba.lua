-----------------------------------
-- mob : Eba
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
	if (kills < 60) then
		killer:setVar("FOMOR_HATE",kills + 4);
	end
end;