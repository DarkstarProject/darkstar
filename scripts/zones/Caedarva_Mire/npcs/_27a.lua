-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Engraved Tablet
-- !pos 763 -9 638 79
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(CYAN_DEEP_SALT)) then
        player:startEvent(304);
    else
        player:startEvent(306);
    end

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

    if (csid == 304 and option == 1) then
        player:delKeyItem(CYAN_DEEP_SALT);
    end

end;