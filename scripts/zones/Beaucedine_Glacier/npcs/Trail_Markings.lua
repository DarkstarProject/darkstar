-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Trail Markings
-- Dynamis-Beaucedine Enter
-- @pos -284 -39 -422 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("DynaBeaucedine_Win") == 1) then
        player:startEvent(0x0086,HYDRA_CORPS_INSIGNIA); -- Win CS
    elseif (player:hasKeyItem(HYDRA_CORPS_COMMAND_SCEPTER) and
        player:hasKeyItem(HYDRA_CORPS_EYEGLASS) and
        player:hasKeyItem(HYDRA_CORPS_LANTERN) and
        player:hasKeyItem(HYDRA_CORPS_TACTICAL_MAP)) then
        local firstDyna = 0;
        local realDay = os.time();
        local dynaWaitxDay = player:getVar("dynaWaitxDay");

        if (checkFirstDyna(player,5)) then  -- First Dyna-Beuc => CS
            firstDyna = 1;
        end

        if (player:getMainLvl() < DYNA_LEVEL_MIN) then
            player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
        elseif dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60) < realDay then
            player:startEvent(0x0077,5,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
        else
            dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
            player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,5);
        end
    else
        player:messageSpecial(UNUSUAL_ARRANGEMENT_OF_BRANCHES);
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
    if (csid == 0x0086) then
        player:setVar("DynaBeaucedine_Win",0);
    elseif (csid == 0x0077 and option == 0) then
        if (checkFirstDyna(player,5)) then
            player:setVar("Dynamis_Status",bit.bor(player:getVar("Dynamis_Status"),32));
        end
        player:setVar("enteringDynamis",1);
        player:setPos(-284.751,-39.923,-422.948,235,0x86);
    end
end;