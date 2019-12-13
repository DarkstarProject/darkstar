-----------------------------------
-- Area: Davoi
--  NPC: Groaning Pond
-- Used In Quest: Whence Blows the Wind
-- !pos 101 0.1 60 149
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(50);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 50 and player:getCharVar("miniQuestForORB_CS") == 1) then

        local c = player:getCharVar("countRedPoolForORB");

        if (c == 0) then
            player:setCharVar("countRedPoolForORB", c + 8);
            player:delKeyItem(dsp.ki.WHITE_ORB);
            player:addKeyItem(dsp.ki.PINK_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PINK_ORB);
        elseif (c == 1 or c == 2 or c == 4) then
            player:setCharVar("countRedPoolForORB", c + 8);
            player:delKeyItem(dsp.ki.PINK_ORB);
            player:addKeyItem(dsp.ki.RED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.RED_ORB);
        elseif (c == 3 or c == 5 or c == 6) then
            player:setCharVar("countRedPoolForORB", c + 8);
            player:delKeyItem(dsp.ki.RED_ORB);
            player:addKeyItem(dsp.ki.BLOOD_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BLOOD_ORB);
        elseif (c == 7) then
            player:setCharVar("countRedPoolForORB", c + 8);
            player:delKeyItem(dsp.ki.BLOOD_ORB);
            player:addKeyItem(dsp.ki.CURSED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CURSED_ORB);
            player:addStatusEffect(dsp.effect.CURSE_I,50,0,900);
        end
    end

end;