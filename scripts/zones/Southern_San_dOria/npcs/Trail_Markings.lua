-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Trail Markings
-- Dynamis-San d'Oria Enter
-- !pos 139 -2 122 230
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if bit.band(player:getVar("Dynamis_Status"),1) == 1 then
        player:startEvent(686); -- cs with Cornelia
    elseif (player:getVar("DynaSandoria_Win") == 1) then
        player:startEvent(698,dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER); -- Win CS
    elseif (player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaSandoria]UniqueID");

        if (checkFirstDyna(player,1)) then  -- First Dyna-San d'oria => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(685,1,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,1);
        end
    else
        player:messageSpecial(ID.text.UNUSUAL_ARRANGEMENT_BRANCHES);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);

    if (csid == 686) then
        player:addKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",bit.band(player:getVar("Dynamis_Status"),bit.bnot(1)));
    elseif (csid == 698) then
        player:setVar("DynaSandoria_Win",0);
    elseif (csid == 685 and option == 0) then
        if (checkFirstDyna(player,1)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),2));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(161.838,-2.000,161.673,93,185);
    end
end;