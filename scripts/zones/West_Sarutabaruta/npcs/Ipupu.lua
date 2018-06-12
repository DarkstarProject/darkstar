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
    if (player:hasKeyItem(dsp.ki.NOTES_FROM_HARIGAORIGA)) then
        player:startEvent(47,0,dsp.ki.NOTES_FROM_HARIGAORIGA);
    else
        player:showText(npc,IPUPU_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("OPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("OPTION: %u",option);

    if (csid == 47) then
        player:delKeyItem(dsp.ki.NOTES_FROM_HARIGAORIGA);
        player:addKeyItem(dsp.ki.NOTES_FROM_IPUPU);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.NOTES_FROM_IPUPU);
    end
end;