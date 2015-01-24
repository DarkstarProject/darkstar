-----------------------------------------
--	ID: 6157
--	Item: Copy of Ferreous's Diary
--	Description: A diary written by
--	Ferreous Coffin that describes his
--	encounters with Orcs in the north. So
--	many were there that his war hammer
--	became coated with a thick layer of
--	blood after all was said and done.
--	Adventurers note that reading it
--	increases one's club skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_CLB) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_CLB,amount);
end;