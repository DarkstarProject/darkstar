-----------------------------------
-- Area: Davoi
-- NPC: Gavotvut
-- Involved in Quest: The Doorman
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if (killer:getVar("theDoormanMyMob") == 1) then
		killer:setVar("theDoormanKilledNM",killer:getVar("theDoormanKilledNM") + 1);
	end

end;