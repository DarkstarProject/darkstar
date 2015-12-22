-----------------------------------
-- Area: Bibiki Bay
-- NPC:  Pohka Chichiyowahl
-- Type: Standard Merchant NPC
-- @pos -415 -2 -430 4
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;

require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,POHKA_SHOP_DIALOG);

    local stock = {
        0x43EC,  1238, 3, -- Fastwater F. Rod
        0x43E6, 11845, 3, -- S.H. Fishing Rod
        0x1034,   290, 3  -- Antidote
    }

    showNationShop(player, WINDURST, stock);
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