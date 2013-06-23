-----------------------------------
--	[Command name]: sets a players variable
--	[Author      ]: link
--	
-- DO NOT USE UNLESS YOU UNDERSTAND WHAT IT DOES
-- Miss use can destroy a players mission, quest satus
--
-- example:
--
-- @setplayervar Link zilartstatus 1
-- will set links zilartstatus to 1 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,variable,value)
	local pc = GetPlayerByName(target);
	pc:setVar(variable,value);
end;
