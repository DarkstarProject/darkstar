-----------------------------------------
--	ID: 6168
--	Item: Copy of Aid For All
--	Description: A guide to the finer
--	points of heightening the potential
--	of one's compatriots, written by
--	Rainemard. It also includes some tips
--	on how to swing special swords.
--	Adventurers note that reading it
--	increases one's enhancing magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_ENH) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_ENH,amount);
end;