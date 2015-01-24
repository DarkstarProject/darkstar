-----------------------------------------
--	ID: 6159
--	Item: Copy of Perih's Primer
--	Description: A guidebook Perih Vashai
--	jotted down for the edification of
--	new recruits. It discusses everything
--	from the various ways of holding a
--	bow to methods of judging distance.
--	Adventurers note that reading it
--	increases one's archery skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_ARC) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_ARC,amount);
end;