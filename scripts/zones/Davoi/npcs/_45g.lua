-----------------------------------
-- Area: Davoi
-- NPC:  Groaning Pond
-- Used In Quest: Whence Blows the Wind
-- @pos 101 0.1 60 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
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
    player:startEvent(0x0032);
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

    if (csid == 0x0032 and player:getVar("miniQuestForORB_CS") == 1) then
        
        local c = player:getVar("countRedPoolForORB");
        
        if (c == 0) then
            player:setVar("countRedPoolForORB", c + 8);
            player:delKeyItem(WHITE_ORB);
            player:addKeyItem(PINK_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, PINK_ORB);
        elseif (c == 1 or c == 2 or c == 4) then
            player:setVar("countRedPoolForORB", c + 8);
            player:delKeyItem(PINK_ORB);
            player:addKeyItem(RED_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, RED_ORB);
        elseif (c == 3 or c == 5 or c == 6) then 
            player:setVar("countRedPoolForORB", c + 8);
            player:delKeyItem(RED_ORB);
            player:addKeyItem(BLOOD_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, BLOOD_ORB);
        elseif (c == 7) then
            player:setVar("countRedPoolForORB", c + 8);
            player:delKeyItem(BLOOD_ORB);
            player:addKeyItem(CURSED_ORB);
            player:messageSpecial(KEYITEM_OBTAINED, CURSED_ORB);
            player:addStatusEffect(EFFECT_CURSE_I,50,0,900);
        end
    end

end;