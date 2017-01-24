-----------------------------------
--
-- Zone: Jugner_Forest_[S] (82)
--
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Jugner_Forest_[S]/TextIDs");

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
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(621.865,-6.665,300.264,149);
    end

    if (player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("ClawsOfGriffonProg") == 0) then
        cs = 0x00C8;

    elseif (player:getVar("roadToDivadomCS") == 1) then
        cs = 0x0069;
    end;

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
    if (csid == 0x00C8) then
        player:setVar("ClawsOfGriffonProg",1);
    elseif (csid == 0x0069 ) then
        player:setVar("roadToDivadomCS", 2);
    end;

end;
