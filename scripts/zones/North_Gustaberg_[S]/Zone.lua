-----------------------------------
--
-- Zone: North_Gustaberg_[S] (88)
--
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(380.038,-2.25,147.627,192);
    end
    if (prevZone == 87 and player:getCampaignAllegiance() > 0 and player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_AVAILABLE) then
        cs = 0x0001;
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
    if (csid == 0x0001) then
        player:addQuest(CRYSTAL_WAR,BETTER_PART_OF_VALOR);
        player:addKeyItem(CLUMP_OF_ANIMAL_HAIR);
        player:messageSpecial(KEYITEM_OBTAINED,CLUMP_OF_ANIMAL_HAIR);
    end
end;