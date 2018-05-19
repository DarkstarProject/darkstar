-----------------------------------
-- Area: Davoi
--  NPC: Wall of Banishing
-- Used In Quest: Whence Blows the Wind
-- !pos 181 0.1 -218 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        if (player:hasKeyItem(dsp.ki.CRIMSON_ORB)) then
            player:startEvent(42);
        else
            player:messageSpecial(CAVE_HAS_BEEN_SEALED_OFF);
            player:messageSpecial(MAY_BE_SOME_WAY_TO_BREAK);
            player:setVar("miniQuestForORB_CS",99);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option,npc)

    if (csid == 42 and option == 0) then
        player:messageSpecial(POWER_OF_THE_ORB_ALLOW_PASS);
        npc:openDoor(12); -- needs retail timing
    end

end;