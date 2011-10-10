require("scripts/globals/settings");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function onMobDeath(mob, killer)

	if (killer:getVar("AyameAndKaede_Event") == 2) then
		leeches = killer:getVar("KorrolokaLeeches");

		killer:setVar("KorrolokaLeeches",leeches+1);
		killer:setVar("KorrolokaLeeches_Timer",os.time());
	end

end;
