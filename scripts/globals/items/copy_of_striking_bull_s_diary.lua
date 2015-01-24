-----------------------------------------
--	ID: 6151
--	Item: Copy of Striking Bull's Diary
--	Description: An account penned by
--	Striking Bull during the Second
--	Battle of Konschtat. It details the
--	Republic's victory over King Raigegue
--	the Lupine's San d'Orian army.
--	Adventurers note that reading it
--	increases one's axe skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_AXE) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_AXE,amount);
end;