-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Ipupu
--  Involved in Quest: Glyph Hanger
-- !pos 251.745 -5.5 35.539 115
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/West_Sarutabaruta/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(NOTES_FROM_HARIGAORIGA)) then
        player:startEvent(47,0,NOTES_FROM_HARIGAORIGA);
    else
        player:showText(npc,IPUPU_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);

    if (csid == 47) then
        player:delKeyItem(NOTES_FROM_HARIGAORIGA);
        player:addKeyItem(NOTES_FROM_IPUPU);
        player:messageSpecial(KEYITEM_OBTAINED,NOTES_FROM_IPUPU);
    end
end;