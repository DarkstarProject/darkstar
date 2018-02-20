-----------------------------------
-- Area: Bastok Mines
--  NPC: Trail Markings
-- Dynamis-Bastok Enter
-- !pos 99 1 -67 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if bit.band(player:getVar("Dynamis_Status"),1) == 1 then
        player:startEvent(203); -- cs with Cornelia
    elseif (player:getVar("DynaBastok_Win") == 1) then
        player:startEvent(215,HYDRA_CORPS_EYEGLASS); -- Win CS
    elseif (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");
        local dynaUniqueID = GetServerVariable("[DynaBastok]UniqueID");

        if (checkFirstDyna(player,2)) then  -- First Dyna-Bastok => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or (player:getVar("DynamisID") == dynaUniqueID and dynaUniqueID > 0)) then
            player:startEvent(201,2,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,2);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_PEBBLES);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);

    if (csid == 203) then
        player:addKeyItem(VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",bit.band(player:getVar("Dynamis_Status"),bit.bnot(1)));
    elseif (csid == 215) then
        player:setVar("DynaBastok_Win",0);
    elseif (csid == 201 and option == 0) then
        if (checkFirstDyna(player,2)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),4));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(116.482,0.994,-72.121,128,0xba);
    end
end;