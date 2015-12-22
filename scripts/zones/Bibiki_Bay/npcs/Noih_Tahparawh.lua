-----------------------------------
--  Area: Bibiki Bay
--  NPC:  Noih Tahparawh
--  Type: Manaclipper
--  @pos -392 -3 -385 4
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;

require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local schedule = 0;
    local vHour = VanadielHour();
    local vMin  = VanadielMinute();

    if (     vHour <=  7) then            --    Schedule                        
        --Do nothing.                --    0: A -  8:40 - Bibiki Bay (Sunset Docks)
    elseif ( vHour ==  8 and vMin <= 40) then    --    1: D -  9:20 - Bibiki Bay (Sunset Docks)
        --Do nothing.                --    2: A - 20:40 - Bibiki Bay (Sunset Docks)
    elseif ( vHour ==  8) then            --    3: D - 21:20 - Bibiki Bay (Sunset Docks)
        schedule = 1;                
    elseif ( vHour ==  9 and vMin <= 20) then    
        schedule = 1;                
    elseif ( vHour <= 19) then            
        schedule = 2;
    elseif ( vHour == 20 and vMin <= 40) then      
        schedule = 2;
    elseif ( vHour == 20) then            
        schedule = 3;
    elseif ( vHour == 21 and vMin <= 20) then    
        schedule = 3;
    end

    local arrive = 0;
    local depart = 0;
    local seconds = 0;

    if (     schedule == 0) then -- Arrival, bound for Bibiki Bay (Sunset Docks)

        arrive = 1;
        
        if (     vHour == 21) then vHour = 11;
        elseif ( vHour == 22) then vHour = 10;
        elseif ( vHour == 23) then vHour = 9;
        elseif ( vHour ==  0) then vHour = 8;
        elseif ( vHour ==  1) then vHour = 7;
        elseif ( vHour ==  2) then vHour = 6;
        elseif ( vHour ==  3) then vHour = 5;
        elseif ( vHour ==  4) then vHour = 4;
        elseif ( vHour ==  5) then vHour = 3;
        elseif ( vHour ==  6) then vHour = 2;
        elseif ( vHour ==  7) then vHour = 1;
        elseif ( vHour ==  8) then vHour = 0;
        end

        seconds = math.floor(2.4 * (vHour * 60 - vMin + 40));

    elseif ( schedule == 1) then -- Departure to Bibiki Bay (Sunset Docks)

        depart = 1;

        if (     vHour ==  8) then vHour = 1;
        elseif ( vHour ==  9) then vHour = 0;
        end

        seconds = math.floor(2.4 * (vHour * 60 - vMin + 20));

    elseif ( schedule == 2) then -- Arrival, bound for Bibiki Bay (Sunset Docks)

        arrive = 1;

        if (     vHour ==  9) then vHour = 11;
        elseif ( vHour == 10) then vHour = 10;
        elseif ( vHour == 11) then vHour = 9;
        elseif ( vHour == 12) then vHour = 8;
        elseif ( vHour == 13) then vHour = 7;
        elseif ( vHour == 14) then vHour = 6;
        elseif ( vHour == 15) then vHour = 5;
        elseif ( vHour == 16) then vHour = 4;
        elseif ( vHour == 17) then vHour = 3;
        elseif ( vHour == 18) then vHour = 2;
        elseif ( vHour == 19) then vHour = 1;
        elseif ( vHour == 20) then vHour = 0;
        end

        seconds = math.floor(2.4 * (vHour * 60 - vMin + 40));

    elseif ( schedule == 3) then -- Departure to Bibiki Bay (Sunset Docks)

        depart = 1;

        if (     vHour == 20) then vHour = 1;
        elseif ( vHour == 21) then vHour = 0;
        end

        seconds = math.floor(2.4 * (vHour * 60 - vMin + 20));
    end

    player:startEvent( 0x0013, seconds, depart, arrive, 3, 0, 0, 0, 0);
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
