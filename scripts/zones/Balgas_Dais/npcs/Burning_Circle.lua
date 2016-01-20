-----------------------------------
-- Area: Balga's Dais
-- NPC:  Burning Circle
-- Balga's Dais Burning Circle
-- @pos 299 -123 345 146
-------------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Balgas_Dais/TextIDs");

    ---- 0: Rank 2 Final Mission for Bastok "The Emissary" and Sandy "Journey Abroad"
    ---- 1: Steamed Sprouts (BCNM 40, Star Orb)
    ---- 2: Divine Punishers (BCNM 60, Moon Orb)
    ---- 3: Saintly Invitation (Windurst mission 6-2)
    ---- 4: Treasure and Tribulations (BCNM 50, Comet Orb)
    ---- 5: Shattering Stars (MNK)
    ---- 6: Shattering Stars (WHM)
    ---- 7: Shattering Stars (SMN)
    ---- 8: Creeping Doom (BCNM 30, Sky Orb)
    ---- 9: Charming Trio (BCNM 20, Cloudy Orb)
    ---- 10: Harem Scarem (BCNM 30, Sky Orb)
    ---- 11: Early Bird Catches the Wyrm (KSNM 99, Themis Orb)
    ---- 12: Royal Succession (BCNM 40, Star Orb)
    ---- 13: Rapid Raptors (BCNM 50, Comet Orb)
    ---- 14: Wild Wild Whiskers (BCNM 60, Moon Orb)
    ---- 15: Season's Greetings (KSNM 30, Clotho Orb)
    ---- 16: Royale Ramble (KSNM 30, Lachesis Orb)
    ---- 17: Moa Constrictors (KSNM 30, Atropos Orb

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (EventTriggerBCNM(player,npc)) then
        return;
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
    
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
    
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    
    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;