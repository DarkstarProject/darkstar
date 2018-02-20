-----------------------------------
-- Area: Ship_bound_for_Mhaura
--  NPC: Sahn
-- Notes: Tells ship ETA time
-- !pos 0.278 -14.707 -1.411 221
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ship_bound_for_Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local vHour = VanadielHour();
    local vMin  = VanadielMinute();

    while vHour >= 6 do
        vHour = vHour - 8;
    end

    if (vHour == -2) then
        vHour = 8;
    elseif (vHour == -1) then
        vHour = 7;
    elseif (vHour ==  0) then
        vHour = 6;
    elseif (vHour ==  1) then
        vHour = 5;
    elseif (vHour ==  2) then
        vHour = 4;
    elseif (vHour ==  3) then
        vHour = 3;
    elseif (vHour ==  4) then
        vHour = 2;
    elseif (vHour ==  5) then
        vHour = 1;
    end

    if (vHour == 8 and vMin <= 40) then
        vHour = 0;
    end

    local vMinutes = (vHour * 60) + 40 - vMin;

    vHour = math.floor( vMinutes / 60 + 0.5);

    local message = ON_WAY_TO_MHAURA;

    if (vMinutes <= 30) then
        message = ARRIVING_SOON_MHAURA;
    elseif (vMinutes < 60) then
        vHour = 0;
    end

    if (vHour > 7) then -- Normal players can't be on the boat longer than 7 Vanadiel hours. This is for GMs.
        vHour = 7;
    end

    player:messageSpecial( message, math.floor((2.4 * ((vHour * 60) + 40 - vMin)) / 60), vHour);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
