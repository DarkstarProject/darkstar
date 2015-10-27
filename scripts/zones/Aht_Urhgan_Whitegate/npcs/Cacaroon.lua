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

    if (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 2) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0352);
	end
    elseif (player:getVar("TOAUM4") == 1) then
        if ((trade:getGil() == 1000 and trade:getItemCount() == 1) or(trade:hasItemQty(2184,1) and trade:getItemCount() == 1)) then
            player:startEvent(0x0bce,0,0,0,0,0,0,0,0,0);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- printf("Prog = %u",player:getVar("ratraceCS"));
    if (player:getVar("ratraceCS") == 2) then 
       player:startEvent(0x0355);
    elseif (player:getVar("ratraceCS") >= 3) then 
       player:startEvent(0x0356);
    elseif (player:getCurrentMission(TOAU) == KNIGHT_OF_GOLD and player:getVar("TOAUM4") == 0) then
        player:startEvent(0x0bdb,0,0,0,0,0,0,0,0,0);
    elseif (player:getVar("TOAUM4") == 1) then
        player:startEvent(0x0bdc,0,0,0,0,0,0,0,0,0);
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
    if (csid == 0x0bdb and option == 1) then
        player:setVar("TOAUM4",1);
    elseif (csid == 0x0bce) then
        player:tradeComplete();
        player:setVar("TOAUM4",2);
    elseif (csid == 0x0352) then			
        player:tradeComplete();
        player:setVar("ratraceCS",3);
    end
end;



