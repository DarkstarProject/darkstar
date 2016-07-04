-----------------------------------
-- Area: Davoi
-- NPC:  Wall of Banishing
-- Used In Quest: Whence Blows the Wind
-- @pos 181 0.1 -218 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (npc:getAnimation() == 9) then
        if (player:hasKeyItem(CRIMSON_ORB)) then
            player:startEvent(0x002a);
        else
            player:messageSpecial(CAVE_HAS_BEEN_SEALED_OFF);
            player:messageSpecial(MAY_BE_SOME_WAY_TO_BREAK);
            player:setVar("miniQuestForORB_CS",99);
        end
    end    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,npc)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x002a and option == 0) then
        player:messageSpecial(POWER_OF_THE_ORB_ALLOW_PASS);
        npc:openDoor(12); -- needs retail timing
    end

end;