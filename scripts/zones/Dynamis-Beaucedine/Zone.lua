-----------------------------------
--
-- Zone: Dynamis-Beaucedine
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-Beaucedine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-Beaucedine/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    local realDay = os.time();
    local dynaWaitxDay = player:getVar("dynaWaitxDay");

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-284.751,-39.923,-422.948,235);
    end

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaBeaucedine]UniqueID")) then
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToDynamis(1284);
                if (inst == 1) then
                    player:bcnmEnter(1284);
                else
                     cs = 0;
                end
            else
                player:bcnmEnter(1284);
            end
        else
            inst = player:bcnmRegister(1284);

            if (inst == 1) then
                player:bcnmEnter(1284);
            else
                cs = 0;
            end
        end
    else
        cs = 0;
    end

    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0) then
        player:setPos(-284.751,-39.923,-422.948,235,0x6F);
    end
end;