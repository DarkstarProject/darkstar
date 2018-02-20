-----------------------------------
-- Area: Port Jeuno
--  NPC: Illauvolahaut
-- @zone 246
-- !pos -12 8 54
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    KazhPass = player:hasKeyItem(AIRSHIP_PASS_FOR_KAZHAM);
    Gil = player:getGil();

    if (KazhPass == false) then
        player:startEvent(35); -- without pass
    elseif (KazhPass == true and Gil < 200) then
        player:startEvent(45); -- Pass without money
    elseif (KazhPass == true) then
        player:startEvent(37); -- Pass with money
    end

end;

-- 0x0029  without addons (ZM) ?

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 37) then
        Z = player:getZPos();

        if (Z >= 58 and Z <= 61) then
            player:delGil(200);
        end
    end

end;

