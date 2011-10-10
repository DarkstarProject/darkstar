require("scripts/globals/settings");
require("scripts/globals/keyItems");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function onMobDeath(mob, killer)

	if (killer:getVar("AyameAndKaede_Event") == 1 and killer:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
		leeches = killer:getVar("KorrolokaLeeches");

		killer:setVar("KorrolokaLeeches",leeches+1);
		killer:setVar("KorrolokaLeeches_Timer",os.time());
	end

end;
