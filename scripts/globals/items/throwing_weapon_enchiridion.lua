-----------------------------------------
--	ID: 6161
--	Item: Throwing Weapon Enchiridion
--	Description: A guide to the finer
--	points of hurling projectile objects
--	at opponents, written by an anonymous
--	individual. Adventurers note that
--	reading it increases one's throwing
--	skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_THR) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_THR,amount);
end;