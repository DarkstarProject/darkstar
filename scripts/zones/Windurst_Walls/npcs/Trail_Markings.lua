-----------------------------------
-- Area: Windurst Walls
--  NPC: Trail Markings
-- Dynamis-Windurst Enter
-- !pos -216 0 -94 239
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
local ID = require("scripts/zones/Windurst_Walls/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if bit.band(player:getVar("Dynamis_Status"),1) == 1 then
        player:startEvent(455); -- cs with Cornelia
    elseif (player:getVar("DynaWindurst_Win") == 1) then
        player:startEvent(465,dsp.ki.HYDRA_CORPS_LANTERN); -- Win CS
    elseif (player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaWindurst]UniqueID");

        if (checkFirstDyna(player,3)) then  -- First Dyna-Windurst => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(452,3,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,3);
        end
    else
        player:messageSpecial(ID.text.STRANDS_OF_GRASS_HERE);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);

    if (csid == 455) then
        player:addKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",bit.band(player:getVar("Dynamis_Status"),bit.bnot(1)));
    elseif (csid == 465) then
        player:setVar("DynaWindurst_Win",0);
    elseif (csid == 452 and option == 0) then
        if (checkFirstDyna(player,3)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),8));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(-221.988,1.000,-120.184,0,187);
    end
end;