-----------------------------------
--
-- 
--
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/conquest");
require("scripts/globals/status");

-----------------------------------
--
-----------------------------------

function onMobDeathEx(mob, killer, isWeaponSkillKill)
	
	-- DRK quest - Blade Of Darkness
	local BladeofDarkness = killer:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
	local BladeofDeath = killer:getQuestStatus(BASTOK, BLADE_OF_DEATH);
	local ChaosbringerKills = killer:getVar("ChaosbringerKills");
	
	if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then

		if(killer:getEquipID(SLOT_MAIN) == 16607 and isWeaponSkillKill == false) then
			if(ChaosbringerKills < 200) then
				killer:setVar("ChaosbringerKills", ChaosbringerKills + 1);	
			end
		end
		
	end
	
	if(killer:getCurrentMission(WINDURST) == A_TESTING_TIME) then
		if(killer:hasCompletedMission(WINDURST,A_TESTING_TIME) and killer:getZone():getID() == 118) then
			killer:setVar("testingTime_crea_count",killer:getVar("testingTime_crea_count") + 1);
		elseif(killer:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and killer:getZone():getID() == 117) then
			killer:setVar("testingTime_crea_count",killer:getVar("testingTime_crea_count") + 1);
		end
	end
	
end;