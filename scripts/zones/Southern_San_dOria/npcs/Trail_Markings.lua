-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Trail Markings
-- Dynamis-San d'Oria Enter
-- @pos 139 -2 122 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if bit.band(player:getVar("Dynamis_Status"),1) == 1 then
        player:startEvent(0x02AE); -- cs with Cornelia
    elseif (player:getVar("DynaSandoria_Win") == 1) then
        player:startEvent(0x02ba,HYDRA_CORPS_COMMAND_SCEPTER); -- Win CS
    elseif (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        
        if (checkFirstDyna(player,1)) then  -- First Dyna-San d'oria => CS
            firstDyna = 1;
        end
        
        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60) < realDay then
            player:startEvent(0x02ad,1,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,1);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_BRANCHES);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);
    
    if (csid == 0x02AE) then
        player:addKeyItem(VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",bit.band(player:getVar("Dynamis_Status"),bit.bnot(1)));
    elseif (csid == 0x02ba) then
        player:setVar("DynaSandoria_Win",0);
    elseif (csid == 0x02ad and option == 0) then
        if (checkFirstDyna(player,1)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),2));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(161.838,-2.000,161.673,93,0xb9);
    end
end;