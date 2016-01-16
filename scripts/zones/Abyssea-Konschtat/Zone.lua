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
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

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
end;