-----------------------------------
--	[Command name]: logoff
--	[Author      ]: bluekirby0
--	[Description ]: Forcibly log another character out of the game.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	pc = GetPlayerByName(target)
	if(pc~=nil) then
		pc:leavegame();
	else
		printf("Player named %s not found!",target);
	end
end;

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
