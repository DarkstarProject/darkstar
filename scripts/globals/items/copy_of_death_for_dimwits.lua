-----------------------------------------
--	ID: 6152
--	Item: Copy of Death for Dimwits
--	Description: A guide to the finer
--	points of hacking everything in one's
--	way to pieces with a two-handed axe,
--	written by an anonymous individual.
--	Adventurers note that reading it
--	increases one's great axe skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_GAX) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_GAX,amount);
end;