-----------------------------------
-- Area: Valkurm_Dunes
-- NPC:  Hieroglyphics
-- Dynamis Valkurm_Dunes Enter
-- @pos 117 -10 133 172 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)  

    if (player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        
        if (checkFirstDyna(player,7)) then 
             player:startEvent(0x0021);
        elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaValkurm]UniqueID")) then
            
            player:startEvent(0x0010,7,0,0,BETWEEN_2DYNA_WAIT_TIME,32,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            printf("dayRemaining : %u",dayRemaining );
            
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,7);
        end
    else
        player:messageSpecial(MYSTERIOUS_VOICE); 
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
    
    if (csid == 0x0021) then
        if (checkFirstDyna(player,7)) then
            player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 128);
        end
    elseif (csid == 0x0010 and option == 0) then
        player:setPos(100,-8,131,47,0x27);
    end
    
end;