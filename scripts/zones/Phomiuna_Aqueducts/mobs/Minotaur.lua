-----------------------------------
-- Minotaur
-----------------------------------

require("scripts/globals/missions");

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
		killer:setVar("FOMOR_HATE",kills - 2);
	else
		killer:setVar("FOMOR_HATE",0);
	end

	if (killer:getCurrentMission(COP) == DISTANT_BELIEFS and killer:getVar("PromathiaStatus") == 0) then
		killer:setVar("PromathiaStatus",1);
	end

end;