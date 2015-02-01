-----------------------------------------
--	ID: 6173
--	Item: Cavernous Score
--	Description: A musical score composed
--	by Lewenhart. Its notes symbolize the
--	damp and musty air that stagnates
--	within an underground cave.
--	Adventurers note that reading it
--	increases one's string instrument
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_STR) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_STR,amount);
end;