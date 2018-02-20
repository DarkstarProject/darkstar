-----------------------------------
-- Area: Uleguerand Range
--  NPC: Fissure
--  Teleports players from underground to surface
-- !pos 380.267 34.859 -179.655 5
-- !pos 460.339 -29.137 220.311 5
-- !pos 180.207 -77.147 500.276 5
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Uleguerand_Range/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local z = player:getZPos();

    if (player:hasKeyItem(MYSTIC_ICE) == true) then
        if (z > -200 and z < -150) then                -- southern Fissure (J-9)
            player:startEvent(2,MYSTIC_ICE);
        elseif (z > 200 and z < 250) then            -- middle Fissure (K-7)
            player:startEvent(3,MYSTIC_ICE);
        elseif (z > 450) then                        -- northern Fissure (I-6)
            player:startEvent(4,MYSTIC_ICE);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if ((csid == 2 or csid == 3 or csid == 4) and option == 2) then
        player:delKeyItem(MYSTIC_ICE);
    end
end;