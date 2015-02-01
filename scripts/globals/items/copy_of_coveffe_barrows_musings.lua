-----------------------------------------
--	ID: 6167
--	Item: Copy of Coveffe Barrows Musings
--	Description: A collection of thoughts
--	scribbled out by Ferreous Coffin on
--	his visit to Coveffe Barrows.
--	Adventurers note that reading it
--	increases one's healing magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_HEA) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_HEA,amount);
end;