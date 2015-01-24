-----------------------------------------
--	ID: 6176
--	Item: Copy of Astral Homeland
--	Description: A specious work written
--	by an unknown individual that both
--	reads and feels like an illusion
--	from the ancient past. It discusses
--	the world avatars inhabit, but seems
--	too absurd to be true. Adventurers
--	note that reading it increases one's
--	summoning magic skill.
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