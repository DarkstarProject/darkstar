-----------------------------------
-- Area: Davoi
--  NPC: Howling Pond
-- Used In Quest: Whence Blows the Wind
-- !pos 21 0.1 -258 149
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(51);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 51 and player:getCharVar("miniQuestForORB_CS") == 1) then

        local c = player:getCharVar("countRedPoolForORB");

        if (c == 0) then
            player:setCharVar("countRedPoolForORB", c + 1);
            player:delKeyItem(dsp.ki.WHITE_ORB);
            player:addKeyItem(dsp.ki.PINK_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PINK_ORB);
        elseif (c == 2 or c == 4 or c == 8) then
            player:setCharVar("countRedPoolForORB", c + 1);
            player:delKeyItem(dsp.ki.PINK_ORB);
            player:addKeyItem(dsp.ki.RED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.RED_ORB);
        elseif (c == 6 or c == 10 or c == 12) then
            player:setCharVar("countRedPoolForORB", c + 1);
            player:delKeyItem(dsp.ki.RED_ORB);
            player:addKeyItem(dsp.ki.BLOOD_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BLOOD_ORB);
        elseif (c == 14) then
            player:setCharVar("countRedPoolForORB", c + 1);
            player:delKeyItem(dsp.ki.BLOOD_ORB);
            player:addKeyItem(dsp.ki.CURSED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CURSED_ORB);
            player:addStatusEffect(dsp.effect.CURSE_I,50,0,900);
        end
    end

end;