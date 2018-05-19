-----------------------------------
--
-- Zone: Abyssea - Konschtat
--
-----------------------------------
-- Research
-- EventID 0x0400-0x0405 aura of boundless rage
-- EventID 0x0800-0x0883 The treasure chest will disappear is 180 seconds menu.
-- EventID 0x0884 Teleport?
-- EventID 0x0885 DEBUG Menu
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Abyssea-Konschtat/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- Note: in retail even tractor lands you back at searing ward, will handle later.
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(153,-72,-840,140);
    end

    if (player:getQuestStatus(ABYSSEA, THE_TRUTH_BECKONS) == QUEST_ACCEPTED
    and player:getVar("1stTimeAyssea") == 0) then
        player:setVar("1stTimeAyssea",1);
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;