-----------------------------------
-- Area: Upper Jeuno
-- NPC:  Marble Bridge Eatery (Door)
-- @pos -96.6 -0.2 92.3 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Upper_Jeuno/TextIDs");

local RajasRing = 15543;
local SattvaRing = 15544;
local TamasRing = 15545;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

    local playerhaveCOPring=false;
    local ringtakeNbr=player:getVar("COP-RingTakeNbr");
    local currentday = tonumber(os.date("%j")); 
    local lastRingday =player:getVar("COP-lastRingday");

    if (player:hasItem(RajasRing) or player:hasItem(SattvaRing) or player:hasItem(TamasRing)) then
        playerhaveCOPring=true;
    end
	
    if (player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 1) then 
        player:startEvent(0x271B);
    elseif (player:getCurrentMission(COP) ==FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus")==3) then
        player:startEvent(0x271C);
    elseif (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")== 4) then
        player:startEvent(0x0081);
    elseif ((player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")> 4) or player:hasCompletedMission(COP,DAWN)) then  	  
        if (playerhaveCOPring == false  ) then
            if (ringtakeNbr==0) then
                player:startEvent(0x0054,RajasRing,SattvaRing,TamasRing); 
            elseif (ringtakeNbr ==1) then -- First time you throw away
                player:startEvent(0x00CC,RajasRing,SattvaRing,TamasRing);
            elseif (ringtakeNbr >1 and (currentday-lastRingday)>26) then -- Ring was thrown away more than once
                player:startEvent(0x00CC,RajasRing,SattvaRing,TamasRing);
            end
        end
    else
        return -1; 
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
local currentday = tonumber(os.date("%j")); 
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
local ringtakeNbr=player:getVar("COP-RingTakeNbr");
	if (csid ==  0x271B) then 
       player:setVar("PromathiaStatus",2);
	elseif (csid ==  0x271C) then  
	   player:setVar("PromathiaStatus",0);
	   player:completeMission(COP,FLAMES_IN_THE_DARKNESS);
	   player:addMission(COP,FIRE_IN_THE_EYES_OF_MEN);
	elseif (csid ==  0x0081) then
	   player:setVar("PromathiaStatus",5);
	   
	elseif ((csid == 0x0054 or csid == 0x00CC) and  option > 4 and player:getFreeSlotsCount() == 0) then
	    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,(option-5)+RajasRing);
		
	elseif ((csid == 0x0054 or csid == 0x00CC)and option == 5) then--5 rajas
	  	player:addItem(RajasRing);
		player:messageSpecial(ITEM_OBTAINED,RajasRing);
		player:setVar("COP-RingTakeNbr",ringtakeNbr+1);
		player:setVar("COP-lastRingday",currentday);
	elseif ((csid == 0x0054 or csid == 0x00CC)and option == 6) then--6 Sattva
		player:addItem(SattvaRing);
		player:messageSpecial(ITEM_OBTAINED,SattvaRing);
		player:setVar("COP-RingTakeNbr",ringtakeNbr+1);	
		player:setVar("COP-lastRingday",currentday);
	elseif ((csid == 0x0054 or csid == 0x00CC) and option == 7) then--7 Tamas
	 	player:addItem(TamasRing);
		player:messageSpecial(ITEM_OBTAINED,TamasRing);
		player:setVar("COP-RingTakeNbr",ringtakeNbr+1);
		player:setVar("COP-lastRingday",currentday);
	end
end;



