-----------------------------------
-- 
-- cermet gate
-- 
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Hall_of_Transference/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(COP) > BELOW_THE_ARKS)then
		player:startEvent(0x0096);
	else
		player:messageSpecial(DOOR_IS_CLOSED);
	end
	
	return 1;
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

	if(csid == 0x0096 and option == 1) then
		local lastp = player:getVar("Stelepoint");
		
		if(lastp == 1 or lastp == 2) then
			player:setPos(152,0 ,-70 ,81 ,18); -- tp to promy dem
		elseif(lastp == 3 or lastp == 4) then
			player:setPos(82 ,0 ,89 ,119 ,16); -- tp to promy holla
		else 
			player:setPos(-107 ,0 ,223 ,164 ,20); -- tp to promy mea
		end
	end

end;