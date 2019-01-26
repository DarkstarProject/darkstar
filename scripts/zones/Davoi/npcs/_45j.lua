-----------------------------------
-- Area: Davoi
--  NPC: Screaming Pond
-- Used In Quest: Whence Blows the Wind
-- !pos -219 0.1 -101 149
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(53);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 53 and player:getVar("miniQuestForORB_CS") == 1) then

        local c = player:getVar("countRedPoolForORB");

        if (c == 0) then
            player:setVar("countRedPoolForORB", c + 4);
            player:delKeyItem(dsp.ki.WHITE_ORB);
            player:addKeyItem(dsp.ki.PINK_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.PINK_ORB);
        elseif (c == 1 or c == 2 or c == 8) then
            player:setVar("countRedPoolForORB", c + 4);
            player:delKeyItem(dsp.ki.PINK_ORB);
            player:addKeyItem(dsp.ki.RED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.RED_ORB);
        elseif (c == 3 or c == 9 or c == 10) then
            player:setVar("countRedPoolForORB", c + 4);
            player:delKeyItem(dsp.ki.RED_ORB);
            player:addKeyItem(dsp.ki.BLOOD_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BLOOD_ORB);
        elseif (c == 11) then
            player:setVar("countRedPoolForORB", c + 4);
            player:delKeyItem(dsp.ki.BLOOD_ORB);
            player:addKeyItem(dsp.ki.CURSED_ORB);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CURSED_ORB);
            player:addStatusEffect(dsp.effect.CURSE_I,50,0,900);
        end
    end

end;