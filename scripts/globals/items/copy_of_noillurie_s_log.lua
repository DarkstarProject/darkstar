-----------------------------------------
--	ID: 6156
--	Item: Copy of Noillurie's Log
--	Description: A record Noillurie kept
--	of her personal experiences. The one
--	that stands out the most is the
--	battle with the colossal beast she
--	undertook to prove herself to her
--	order. Adventurers note that reading
--	it increases one's great katana skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_GKT) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_GKT,amount);
end;