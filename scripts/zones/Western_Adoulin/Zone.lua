-----------------------------------
--
-- Zone: Western Adoulin
-- !zone 256
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-142, 4, -18, 4);
    end

    if (player:getVar("Raptor_Rapture_Status") == 2) then
        -- Resuming cutscene for Quest: 'Raptor Rapture', after Pagnelle warps you to Rala Waterways mid-CS, then back here.
        cs = 5056;
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 5056) then
        -- Successfully finished introduction CS event chain for Quest: 'Raptor Rapture'.
        player:setVar("Raptor_Rapture_Status", 3);

        if (option == 1) then
            -- Starts Quest: 'Raptor Rapture'
            player:addQuest(ADOULIN, RAPTOR_RAPTURE);
            player:setVar("Raptor_Rapture_Status", 4);
        end
    end
end;
