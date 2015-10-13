-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Excavation Site (Olduum Ring quest)
-- @pos 390 1 349 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------
 
require("scripts/globals/keyitems");
require("scripts/zones/Aydeewa_Subterrane/TextIDs");
 
-----------------------------------
-- onTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
    if (player:hasKeyItem(DKHAAYAS_RESEARCH_JOURNAL)) then -- If no journal, just stop right here
        if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade Pickaxe
            local keyItems =
            {
                ELECTROCELL,
                ELECTROPOT,
                ELECTROLOCOMOTIVE,
            }
            local KI = math.random(1,3);
            if (player:hasKeyItem(ELECTROCELL) or player:hasKeyItem(ELECTROPOT) or player:hasKeyItem(ELECTROLOCOMOTIVE)) == false then
                player:tradeComplete();
                player:addKeyItem(keyItems[KI]);
                player:messageSpecial(KEYITEM_OBTAINED, keyItems[KI]);
            end
        end
    end
end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
 
function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
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
end;
