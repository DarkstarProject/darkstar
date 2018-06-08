-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Telepoint
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.PASHHOW_GATE_CRYSTAL) == false) then
        player:addKeyItem(dsp.ki.PASHHOW_GATE_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PASHHOW_GATE_CRYSTAL);
    else
        player:messageSpecial(ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;