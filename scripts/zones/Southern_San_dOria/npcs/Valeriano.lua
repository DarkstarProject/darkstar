-----------------------------------
-- Area: Southern_San_dOria
-- NPC: Valeriano
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc,VALERIANO_SHOP_DIALOG);

    local stock = {
        0x112A,    10, -- Ginger Cookie
        0x43C1,    43, -- Flute
        0x43C3,   990, -- Piccolo
        0x1399,   585, -- Scroll of Scop's Operetta
        0x139A, 16920, -- Scroll of Puppet's Operetta
        0x1395,  2916, -- Scroll of Fowl Aubade
        0x13A3,  2059, -- Scroll of Advancing March
        0x13D0, 90000, -- Scroll of Goddess's Hymnus
        0x13BE, 32844, -- Scroll of Fire Carol II
        0x13C0, 30912, -- Scroll of Wind Carol II
        0x13C1, 27140, -- Scroll of Earth Carol II
        0x13C3, 28520, -- Scroll of Water Carol II
        0x1384,123880  -- Scroll of Mage's Ballad III
    }
    showShop(player, SANDORIA, stock);

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
