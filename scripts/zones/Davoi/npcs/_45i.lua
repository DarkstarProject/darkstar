-----------------------------------
-- Area: Davoi
--  NPC: Wailing Pond
-- Used In Quest: Whence Blows the Wind
-- !pos 380 0.1 -181 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(52);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 52 and player:getVar("miniQuestForORB_CS") == 1) then

        local c = player:getVar("countRedPoolForORB");

        if (c == 0) then
            player:setVar("countRedPoolForORB", c + 2);
            player:delKeyItem(WHITE_ORB);
            player:addKeyItem(PINK_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, PINK_ORB);
        elseif (c == 1 or c == 4 or c == 8) then
            player:setVar("countRedPoolForORB", c + 2);
            player:delKeyItem(PINK_ORB);
            player:addKeyItem(RED_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, RED_ORB);
        elseif (c == 5 or c == 9 or c == 12) then
            player:setVar("countRedPoolForORB", c + 2);
            player:delKeyItem(RED_ORB);
            player:addKeyItem(BLOOD_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, BLOOD_ORB);
        elseif (c == 13) then
            player:setVar("countRedPoolForORB", c + 2);
            player:delKeyItem(BLOOD_ORB);
            player:addKeyItem(CURSED_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, CURSED_ORB);
            player:addStatusEffect(EFFECT_CURSE_I,50,0,900);
        end
    end

end;