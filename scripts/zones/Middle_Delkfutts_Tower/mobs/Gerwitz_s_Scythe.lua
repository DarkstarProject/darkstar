-----------------------------------
-- Area: Middle Delfutt's Tower
-- NPC:  Gerwitz's Scythe
-- Involved In Quest: Blade of Evil
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if (killer:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_ACCEPTED) then
		killer:setVar("bladeOfEvilCS",1);
	end

end;