-----------------------------------------
--	ID: 6175
--	Item: Copy of Yomi's Diagram
--	Description: A meticulously drawn
--	diagram Yomi made for Kagetora
--	explaining how to construct certain
--	ninja tools. Adventurers note that
--	reading it increases one's ninjutsu
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_NIN) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_NIN,amount);
end;