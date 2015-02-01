-----------------------------------------
--	ID: 6149
--	Item: Copy of Swing and Stab
--	Description: Ulla wrote this guide on
-- sword wielding--from how to grip the
-- hilt to tips on footwork--so others
-- could follow in her footsteps.
-- Adventurers note that reading it
-- increases one's sword skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_SWD) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_SWD,amount);
end;