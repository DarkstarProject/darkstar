-----------------------------------
--	[Command name]: set a players level
--	[Author      ]: link
--	[Description ]: (@setplayerlevel Link 75) will links level to 75
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,level)
	pc = GetPlayerByName(target);
	pc:setLevel(level);
end;

--function onTrigger(player,target)


-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("CS : onEventUpdate");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("CS : onEventFinish");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
