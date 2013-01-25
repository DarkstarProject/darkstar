-----------------------------------
-- Area: Sealion's Den
-- NPC:  Iron Gate
-- @pos 612 132 774 32
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Sealions_Den/TextIDs");
require("scripts/globals/titles");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(TradeBCNM(player,player:getZone(),trade,npc))then
		return;
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if(player:getCurrentMission(COP) == SLANDEROUS_UTTERINGS and player:getVar("PromathiaStatus") == 1)then
	player:startEvent(0x000D);
	elseif(EventTriggerBCNM(player,npc))then
		return 0;
	elseif(player:hasKeyItem(LIGHT_OF_ALTAIEU) == true) then
	player:startEvent(0x000C);	
	end
	
	return 0;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if(EventUpdateBCNM(player,csid,option))then
		return 1;
	end
	end;

-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(EventFinishBCNM(player,csid,option)) then
		return;
	end
	if(csid == 0x000c and option == 1) then 
	player:setPos(-25,-1 ,-620 ,208 ,33);
	elseif(csid == 0x000D)then
	player:setVar("PromathiaStatus",0);
	player:completeMission(COP,SLANDEROUS_UTTERINGS);
	player:addMission(COP,THE_RETURN_HOME);
	player:addTitle(THE_LOST_ONE);
	end
	end;