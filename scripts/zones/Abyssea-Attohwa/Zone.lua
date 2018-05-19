-----------------------------------
--
-- Zone: Abyssea - Attohwa
--
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Abyssea-Attohwa/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-134,-20,-182,108);
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