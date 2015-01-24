-----------------------------------------
--	ID: 6154
--	Item: Copy of Clash of Titans
--	Description: An article detailing the
--	duel between Yrvaulair S Cousseraux
--	and Alphonimile M Aurchiat that
--	became all the rage in San d'Oria
--	after appearing in a popular
--	newspaper. Adventurers note that
--	reading it increases one's polearm
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_POL) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_POL,amount);
end;