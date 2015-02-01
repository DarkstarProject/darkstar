-----------------------------------------
--	ID: 6169
--	Item: Investigative Report
--	Description: A collection of
--	observations made by Rainemard on a
--	particular exploration. It goes into
--	such detail on so much minutiae that
--	many admit to never finishing it.
--	Adventurers note that reading it
--	increases one's enfeebling magic
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_ENF) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_ENF,amount);
end;