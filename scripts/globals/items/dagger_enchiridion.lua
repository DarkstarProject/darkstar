-----------------------------------------
--	ID: 6148
--	Item: Dagger Enchiridion
--	Description: A guide to the finer
--	points of wielding a dagger, written
--	by an anonymous individual.
--	Adventurers note that reading it
--	increases one's dagger skill.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	if (target:isSkillMax(SKILL_DAG) == 1) then
		result = 56;
	end
	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = math.random(1,5);
	target:addSkillUp(SKILL_DAG,amount);
end;