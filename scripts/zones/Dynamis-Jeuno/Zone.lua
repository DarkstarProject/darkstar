-----------------------------------
--
-- Zone: Dynamis-Jeuno
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-Jeuno/TextIDs");

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

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaJeuno]UniqueID")) then
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToDynamis(1283);

                if (inst == 1) then
                    player:bcnmEnter(1283);
                else
                     cs = 0;
                end
            else
                player:bcnmEnter(1283);
            end
        else
            inst = player:bcnmRegister(1283);

            if (inst == 1) then
                player:bcnmEnter(1283);
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
        player:setPos(48.930,10.002,-71.032,195,0xF3);
    end

end;