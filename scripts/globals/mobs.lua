-----------------------------------
--
-- 
--
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/conquest");

-----------------------------------
--
-----------------------------------

function onMobDeathEx(mob,killer)
	
	-- DRK quest - Blade Of Darkness
	if(killer:getQuestStatus(BASTOK,BLADE_OF_DARKNESS) == QUEST_ACCEPTED and killer:getEquipID(0) == 16607) then
		local SwordKills = killer:getVar("Blade_of_Darkness_SwordKills"); 
		if (SwordKills < 100) then
			killer:setVar("Blade_of_Darkness_SwordKills", SwordKills + 1);	
		end
	end

	-- CP is 10% of the XP points
	addCP(killer,15);
end;