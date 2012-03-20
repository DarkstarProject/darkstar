-----------------------------------
--	Author: ReaperX
-- 	Brass dor
--  
-----------------------------------

function onTrigger(player,npc)

	if(player:getZPos() < -12) then
		player:messageSpecial(6);
		
		return 1;
	else
		npc:setState(10);
	end

end;