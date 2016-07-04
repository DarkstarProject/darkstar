-----------------------------------
-- Area: Tavnazian Safehold
-- NPC:  Despachiaire
-- @pos 108 -40 -83 26
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 local currentCOPMission = player:getCurrentMission(COP);
 local LouverancePathStatut = player:getVar("COP_Louverance_s_Path");
 
    if (currentCOPMission  == THE_LOST_CITY and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(0x0066);
    elseif (currentCOPMission  == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 1) then    
        player:startEvent(0x006C);
    elseif (currentCOPMission  == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_Despachaire") == 0) then
        player:startEvent(0x0075); --117
    elseif (currentCOPMission  == THREE_PATHS and LouverancePathStatut == 0) then                  
        player:startEvent(0x0076);
    elseif (currentCOPMission  == THREE_PATHS and LouverancePathStatut == 1 ) then
         player:startEvent(0x0086);
    else
        player:startEvent(0x006A);
    end
    
end; 
--Despachiaire     102 ++
--Despachiaire     104 ++
--Despachiaire     106 ++
--Despachiaire     107 ++
--Despachiaire     108 ++
--Despachiaire     110 ++
--Despachiaire     112 ++
--Despachiaire     117 ++
--Despachiaire     118 ++
--Despachiaire     132
--Despachiaire     133
--Despachiaire     134 ??
--Despachiaire     139
--Despachiaire     144 chat
--Despachiaire     149 XX
--Despachiaire     315 chat
--Despachiaire     317 chat
--Despachiaire     318 chat
--Despachiaire     505 CS
--Despachiaire     517 CS (despachiaire's wife)
--Despachiaire     518 CS (ulmia mother)
--Despachiaire     576 CS
--Despachiaire     577 chat
--Despachiaire     578 chat
--Despachiaire     579 chat
--Despachiaire     617 XX
--Despachiaire     618 XX
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
  
    if (csid == 0x0066 or csid == 0x006C) then
        player:setVar("PromathiaStatus",2);
    elseif (csid == 0x0075) then
        player:setVar("COP_optional_CS_Despachaire",1);    
    elseif (csid == 0x0076) then 
        player:setVar("COP_Louverance_s_Path",1);        
    end
  
end;