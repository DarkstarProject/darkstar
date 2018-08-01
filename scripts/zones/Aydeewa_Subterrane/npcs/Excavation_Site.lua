-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Excavation Site (Olduum Ring quest)
-- !pos 390 1 349 68
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:hasKeyItem(dsp.ki.DKHAAYAS_RESEARCH_JOURNAL)) then -- If no journal, just stop right here
        if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade Pickaxe
            local keyItems =
            {
                dsp.ki.ELECTROCELL,
                dsp.ki.ELECTROPOT,
                dsp.ki.ELECTROLOCOMOTIVE,
            }
            local KI = math.random(1,3);
            if (player:hasKeyItem(dsp.ki.ELECTROCELL) or player:hasKeyItem(dsp.ki.ELECTROPOT) or player:hasKeyItem(dsp.ki.ELECTROLOCOMOTIVE)) == false then
                player:tradeComplete();
                player:addKeyItem(keyItems[KI]);
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, keyItems[KI]);
            end
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
