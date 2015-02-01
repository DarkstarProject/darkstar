-----------------------------------------
--	ID: 6166
--	Item: Copy of Altana's Hymn
--	Description: A copy of Febrenard C
--	Brunnaut's favorite read. The simple
--	lyrics and enchanting meter were said
--	to have soothed his soul. Adventurers
--	note that reading it increases one's
--	divine magic skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_DIV) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_DIV,amount);
end;