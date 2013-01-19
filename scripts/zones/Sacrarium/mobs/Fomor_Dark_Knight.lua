
-----------------------------------
-- mob : Fomor Dark knight
-- zone : Sacrarium 
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

	local kills = killer:getVar("FOMOR_HATE");
	if(kills < 60) then
		killer:setVar("FOMOR_HATE",kills + 2);
	end
end;