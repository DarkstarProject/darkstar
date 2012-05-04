-----------------------------------
--	[Command name]: homepoint
--	[Author      ]: bluekirby0
--	[Description ]: If a player name is specified, warps the player to their homepoint. 
--                  If no name is specified, warp yourself.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	pc = GetPlayerByName(target)
	if(pc~=nil) then
		pc:warp();
	elseif(target==nil) then
		player:warp();
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
