-----------------------------------------
--	ID: 6179
--	Item: Copy of The Bell Tolls
--	Description: A record of what
--	happened on the fateful day the
--	lifestream overflowed, as kept by
--	Hrohj Wagrehsa. Adventurers note that
--	reading it increases one's geomancy
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_GEO) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_GEO,amount);
end;