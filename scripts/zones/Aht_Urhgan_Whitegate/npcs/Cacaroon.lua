-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Cacaroon
-- Standard Info NPC
-- @pos -72.026 0.000 -82.337 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if(player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 2) then
        if(trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0352);
	    end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- printf("Prog = %u",player:getVar("ratraceCS"));
    if(player:getVar("ratraceCS") == 2) then 
       player:startEvent(0x0355);
	elseif(player:getVar("ratraceCS") >= 3) then 
       player:startEvent(0x0356);
	else
	   player:startEvent(0x00f8);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if(csid == 0x0352) then			
	   player:tradeComplete();
	   player:setVar("ratraceCS",3);
	end
end;



