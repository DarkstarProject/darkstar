-----------------------------------
--
-- 
--
-----------------------------------

require("scripts/globals/quests");

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
end;