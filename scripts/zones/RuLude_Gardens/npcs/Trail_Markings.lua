-----------------------------------
-- Area: Rulude Gardens
--  NPC: Trail Markings
-- Dynamis-Jeuno Enter
-- !pos 35 9 -51 243
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
local ID = require("scripts/zones/RuLude_Gardens/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if bit.band(player:getVar("Dynamis_Status"),1) == 1 then
        player:startEvent(10016); -- cs with Cornelia
    elseif (player:getVar("DynaJeuno_Win") == 1) then
        player:startEvent(10026,dsp.ki.HYDRA_CORPS_TACTICAL_MAP); -- Win CS
    elseif (player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaJeuno]UniqueID");

        if (checkFirstDyna(player,4)) then  -- First Dyna-Jeuno => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(10012,4,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,dsp.ki.VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) - realDay)/3456);
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,4);
        end
    else
        player:messageSpecial(ID.text.UNUSUAL_ARRANGEMENT_LEAVES);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("finishRESULT: %u",option);

    if (csid == 10016) then
        player:addKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",bit.band(player:getVar("Dynamis_Status"),bit.bnot(1)));
    elseif (csid == 10026) then
        player:setVar("DynaJeuno_Win",0);
    elseif (csid == 10012 and option == 0) then
        if (checkFirstDyna(player,4)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),16));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(48.930,10.002,-71.032,195,188);
    end
end;