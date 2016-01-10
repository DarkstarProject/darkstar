-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Ipupu
-- Involved in Quest: Glyph Hanger
-- @pos 251.745 -5.5 35.539 115
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/West_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(NOTES_FROM_HARIGAORIGA)) then
        player:startEvent(0x002f,0,NOTES_FROM_HARIGAORIGA);
    else
        player:showText(npc, text.text.IPUPU_DIALOG);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);

    if (csid == 0x002f) then
        player:delKeyItem(NOTES_FROM_HARIGAORIGA);
        player:addKeyItem(NOTES_FROM_IPUPU);
        player:messageSpecial(text.text.KEYITEM_OBTAINED,NOTES_FROM_IPUPU);
    end
end;
