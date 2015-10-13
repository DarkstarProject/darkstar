
-----------------------------------
-- mob : Teratotaur
-- zone : Sacrarium
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
	if (kills > 4) then
		killer:setVar("FOMOR_HATE",kills -4);
	end
end;