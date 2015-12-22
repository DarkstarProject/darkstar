-----------------------------------
-- Area: Windurst-Jeuno Airship
-- NPC:  Gabriele
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Windurst-Jeuno_Airship/TextIDs"] = nil;

require("scripts/zones/Windurst-Jeuno_Airship/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local vHour = VanadielHour();
    local vMin  = VanadielMinute();

    while vHour >= 4 do
        vHour = vHour - 6;
    end

    local message = WILL_REACH_WINDURST;

    if (vHour == -2) then
        if (vMin >= 47) then
            vHour = 3;
            message = WILL_REACH_JEUNO;
        else
            vHour = 0;
        end
    elseif (vHour == -1) then
        vHour = 2;
        message = WILL_REACH_JEUNO;
    elseif (vHour == 0) then
        vHour = 1;
        message = WILL_REACH_JEUNO;    
    elseif (vHour == 1) then
        if (vMin <= 40) then
            vHour = 0;
            message = WILL_REACH_JEUNO;
        else
            vHour = 3;
        end
    elseif (vHour == 2) then
        vHour = 2;
    elseif (vHour == 3) then
        vHour = 1;
    end

    local vMinutes = 0;

    if (message == WILL_REACH_JEUNO) then
        vMinutes = (vHour * 60) + 47 - vMin;
    else -- WILL_REACH_WINDURST
        vMinutes = (vHour * 60) + 40 - vMin;
    end

    if (vMinutes <= 30) then
        if ( message == WILL_REACH_WINDURST) then
            message = IN_WINDURST_MOMENTARILY;
        else -- WILL_REACH_JEUNO
            message = IN_JEUNO_MOMENTARILY;
        end
    elseif (vMinutes < 60) then
        vHour = 0;
    end

    player:messageSpecial( message, math.floor((2.4 * vMinutes) / 60), math.floor( vMinutes / 60 + 0.5));
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
end;