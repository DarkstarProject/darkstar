-----------------------------------------
--	ID: 6177
--	Item: Copy of Life-form Study
--	Description: A report written and
--	filed by an anonymous individual. It
--	covers the behavioral patterns and
--	diets of almost every known family of
--	beasts in existence. Adventurers note
--	that reading it increases one's blue
--	magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_BLU) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_BLU,amount);
end;