-----------------------------------------
--	ID: 6174
--	Item: Beaming Score
--	Description: A musical score composed
--	by Lewenhart. Its notes symbolize the
--	gently glowing beams of light that
--	filter through the leaves of a
--	deciduous tree in the late afternoon.
--	Adventurers note that reading it
--	increases one's wind instrument skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_WND) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_WND,amount);
end;