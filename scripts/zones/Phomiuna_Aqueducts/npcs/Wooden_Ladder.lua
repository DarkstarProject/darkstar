-----------------------------------
-- Area: Phomiuna Aqueducts
-- NPC:  Wooden Ladder
-- @pos 101.9 -1.5 -101.9
-- @pos 101.948 -1.5 -18.016
-- @pos -61.888 -1.5 -18.079
-- @pos -218.109 -1.499 18.081
-- @pos -61.903 -1.5 138.099
-- @pos 21.901 -1.5 138.096
-- @pos 101.902 -1.5 181.902
-- @pos  -159.32 -2.5 60
-- @pos -159.38 -22.559 60
-- @pos 199.317 -2.5 60
-- @pos 199.38 -22.559 60
-- @pos -200.679 -8.57 60
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local X = player:getXPos();
    local Y = player:getYPos();
    local Z = player:getZPos();
    
    if ((X <= 107.9 and X >= 95.9) and (Y >= -1 and Y <= 1) and (Z >= -108.9 and Z <= -98)) then
        player:startEvent(0x0015);
    elseif ((X <= 107.9 and X >= 95.9) and (Y >= -1 and Y <= 1) and (Z >= -24 and Z <= -12)) then
        player:startEvent(0x0016);
    elseif ((X <= -55.888 and X >= -67.888) and (Y >= -1 and Y <= 1) and (Z >= -24 and Z <= -12)) then
        player:startEvent(0x0017);
    elseif ((X <= -212.1 and X >= -224.1) and (Y >= -1 and Y <= 1) and (Z >= 12 and Z <= 24)) then
        player:startEvent(0x0018);
    elseif ((X <= -55.9 and X >= -67.9) and (Y >= -1 and Y <= 1) and (Z >= 132 and Z <= 144)) then
        player:startEvent(0x0019);
    elseif ((X <= 27.9 and X >= 15.9) and (Y >= -1 and Y <= 1) and (Z >= 132 and Z <= 144)) then
        player:startEvent(0x001a);
    elseif ((X <= 107.9 and X >= 95.9) and (Y >= -1 and Y <= 1) and (Z >= 175.9 and Z <= 187.9)) then
        player:startEvent(0x001b);
    elseif ((X <= -153.3 and X >= -168.3) and (Y >= -2 and Y <= 0) and (Z >= 54 and Z <= 66)) then
        if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 1) then
            player:setVar("PromathiaStatus",2);
            player:startEvent(0x0023);
        else
            player:startEvent(0x001c);
        end
    elseif ((X <= -153.3 and X >= -168.3) and (Y >= -24 and Y <= -22) and (Z >= 54 and Z <= 66)) then
        player:startEvent(0x001d);
    elseif ((X <= 205.3 and X >= 193.3) and (Y >= -2 and Y <= 0) and (Z >= 54 and Z <= 66)) then
        player:startEvent(0x001e);
    elseif ((X <= 205.3 and X >= 193.3) and (Y >= -24 and Y <= -22) and (Z >= 54 and Z <= 66)) then
        player:startEvent(0x001f);
    elseif ((X <= -194.6 and X >= -206.6) and (Y >= -8 and Y <= -6) and (Z >= 54 and Z <= 66)) then
        player:messageSpecial(DOOR_SEALED_SHUT);
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
end;