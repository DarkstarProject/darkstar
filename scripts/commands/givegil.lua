-----------------------------------
--	[Command name]: give gil to player
--	[Author      ]: link
--	[Description ]: (@givegil Link 100) will give 100 gill to link
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,quantity)
	pc = GetPlayerByName(target);
	pc:addGil(quantity);
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
