-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------
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
    local stock =
    {
        21504, 100100, -- Arasy Sainti
        21554, 100100, -- Arasy Knife
        21604, 100100, -- Arasy Sword
        21654, 100100, -- Arasy Claymore
        21704, 100100, -- Arasy Tabar
        21762, 100100, -- Arasy Axe
        21812, 100100, -- Arasy Scythe
        21865, 100100, -- Arasy Lance
        21909, 100100, -- Yoshikiri
        21960, 100100, -- Ashijiro no Tachi
        22015, 100100, -- Arasy Rod
        22074, 100100, -- Arasy Staff
        22122, 100100, -- Arasy Bow
        22135, 100100, -- Arasy Gun
        21392, 100100, -- Animator Z
        21393, 100100  -- Arasy Sachet
    }
    player:showText(npc,ANTONIA_SHOP_DIALOG);
    showShop(player, STATIC, stock);
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
